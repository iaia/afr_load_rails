# encoding: utf-8
require "yaml"

yaml_ability = YAML.load_file("#{File.dirname(__FILE__)}/seeds/ability.yml")

yaml_ability.each do |role_name, domain_ability|
    role = Role.find_or_create_by(name: role_name)
    domain_ability.each do |domain, abilities|
        abilities.each do |ability|
            role.abilities << Ability.find_or_create_by(domain: domain, ability: ability)
            p "#{role_name} #{domain} #{ability}"
        end
    end
    role.save
end

yaml_tv_program_info = YAML.load_file("#{File.dirname(__FILE__)}/seeds/tv_program_information.yml")

yaml_tv_program_info.each do |tv_name, time|
    tv_info = TvProgramInfomation.find_or_create_by(name: tv_name, on_air_minutes: time.first)
    p "#{tv_name} #{time.first}"
    tv_info.save
end

yaml_topics = YAML.load_file("#{File.dirname(__FILE__)}/seeds/topics.yml")

yaml_topics.each do |tv_name, terms|
    tv_info = TvProgramInfomation.where(name: tv_name).first
    terms.each do |term|
        tv_info.topics.find_or_create_by(term: term)
        p "#{tv_name} #{term}"
    end
    tv_info.save
end

yaml_provider = YAML.load_file("#{File.dirname(__FILE__)}/seeds/comment_provider.yml")

yaml_provider.each do |name, url|
    provider = CommentProvider.find_or_create_by(name: name, url: url)
    p "#{name} #{url}"
    provider.save
end
