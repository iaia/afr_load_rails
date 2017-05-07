module CommentGetter
  class Status
    attr_accessor :id_on_provider, :body, :user_name, :commented_time

    def initialize(args = {})
      args.each_pair do |key, val|
        instance_variable_set("@#{key}", val)
      end
      yield(self) if block_given?
    end
  end
end
