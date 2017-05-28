# encoding: utf-8
require "yaml"

def create_ability
  yaml_ability = YAML.load_file("#{File.dirname(__FILE__)}/seeds/ability.yml")

  yaml_ability.each do |role_name, domain_ability|
    role = Role.find_or_create_by(name: role_name)
    arr_abi = []
    domain_ability.each do |domain, abilities|
      abilities.each do |ability|
        arr_abi << Ability.find_or_create_by(domain: domain, ability: ability)
      end
    end
    role.abilities = arr_abi
    role.save!
  end
end

def create_tv_program_info
  yaml_tv_program_info = YAML.load_file("#{File.dirname(__FILE__)}/seeds/tv_program_information.yml")

  yaml_tv_program_info.each do |tv_name, time|
    tv_info = TvProgramInfomation.find_or_create_by(name: tv_name, on_air_minutes: time.first)
    tv_info.save!
  end
end

def create_topics
  yaml_topics = YAML.load_file("#{File.dirname(__FILE__)}/seeds/topics.yml")

  yaml_topics.each do |tv_name, terms|
    tv_info = TvProgramInfomation.where(name: tv_name).first
    terms.each do |term|
      tv_info.topics.find_or_create_by(term: term)
    end
    tv_info.save!
  end
end

def create_comment_provider
  yaml_provider = YAML.load_file("#{File.dirname(__FILE__)}/seeds/comment_provider.yml")

  yaml_provider.each do |name, url|
    provider = CommentProvider.find_or_create_by(name: name, url: url)
    provider.save!
  end
end

create_ability
create_tv_program_info
create_topics
create_comment_provider
