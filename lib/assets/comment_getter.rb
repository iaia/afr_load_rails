# encoding: utf-8

require_relative "comment_getter/twitter_getter"

module CommentGetter
  class CommentGetter
    def initialize(now, tv_info_name, provider_name)
      p TvProgram.where(on_air_start: now..(now + Rational(1, 24))).to_sql
      @tv = TvProgram.where(on_air_start: now..(now + Rational(1, 24))).first
      @provider = CommentProvider.where(name: provider_name).first

      @getter = eval("#{provider_name}Getter.create_client(tv_info_name, @tv)")
    end

    def prepare_ok?
      if @getter.nil? or @provider.nil? or @tv.nil? or @getter.on_air_time.nil?
        false
      else
        true
      end
    end

    def start
      return unless prepare_ok?

      EM.run do
        puts "****** get_afr_load start!"
        # 放映時間120m + 前2m + 後ろ5m
        EM::PeriodicTimer.new((@getter.on_air_time + 2 + 5) * 60) do
          puts "****** get_afr_load end!"
          EM.stop
        end

        @getter.get do |status|
          create_comment(status)
        end
      end
    end

    def create_comment(status)
      p status
      comment = Comment.find_or_create_by(
        tv_program_id: @tv.id,
        provider_id: @provider.id,
        comment_id_on_provider: status.id_on_provider
      )
      comment.update_attributes(
        body: status.body,
        user_name: status.user_name,
        commented_time: status.commented_time
      )
      comment.save
      save_comment_contents(comment, status)
    rescue => ex
      p "failed insert. #{ex.message}"
    end

    def save_comment_contents(comment, status)
      status.contents.each do |media|
        expanded_url = media.media_url_https? ? media.media_url_https : media.expanded_url
        comment.contents << CommentContent.find_or_create_by(
          url: media.uri.to_s, expanded_url: expanded_url.to_s
        )
      end
    end
  end
end
