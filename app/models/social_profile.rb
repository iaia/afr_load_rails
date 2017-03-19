class SocialProfile < ApplicationRecord
    belongs_to :user
    store :other
    validates_uniqueness_of :uid, scope: :provider

    def self.find_for_oauth(auth)
        profile = SocialProfile.find_or_initialize_by(provider: auth['provider'], uid: auth['uid'])
        profile.set_values(auth)
        if profile.new_record?
            role = Role.find_by(name: "user")
            profile.user = User.create(name: "#{auth['provider']}#{auth['uid']}", role_id: role.id)
        end
        profile.save!
        profile
    end

    def set_values(omniauth)
        credentials = omniauth['credentials']
        info = omniauth['info']

        self.credentials = credentials.to_json
        self.email = info['email']
        self.name = info['name']
        self.nickname = info['nickname']
        self.description = info['description'].try(:truncate, 255)
        self.image_url = info['image']
        case provider.to_s
        when 'hatena'
            self.url = "https://www.hatena.ne.jp/#{uid}/"
        when 'github'
            self.url = info['urls']['GitHub']
            self.other[:blog] = info['urls']['Blog']
        when 'google'
            self.nickname ||= info['email'].sub(/(.+)@gmail.com/, '\1')
        when 'linkedin'
            self.url = info['urls']['public_profile']
        when 'mixi'
            self.url = info['urls']['profile']
        when 'twitter'
            self.url = info['urls']['Twitter']
            self.other[:location] = info['location']
            self.other[:website] = info['urls']['Website']
        end

        self.set_values_by_raw_info(omniauth['extra']['raw_info'])
    end

    def set_values_by_raw_info(raw_info)
        case provider.to_s
        when 'google'
            self.url = raw_info['link']
        when 'twitter'
            self.other[:followers_count] = raw_info['followers_count']
            self.other[:friends_count] = raw_info['friends_count']
            self.other[:statuses_count] = raw_info['statuses_count']
        end

        self.raw_info = raw_info.to_json
    end
end
