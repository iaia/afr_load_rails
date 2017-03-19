# encoding: utf-8
require "yaml"

yaml_ability = YAML.load_file("#{File.dirname(__FILE__)}/seeds/ability.yml")

yaml_ability.each do |role_name, domain_ability|
    role = Role.create(name: role_name)
    domain_ability.each do |domain, abilities|
        abilities.each do |ability|
            role.abilities << Ability.create(domain: domain, ability: ability)
            p "#{role_name} #{domain} #{ability}"
        end
    end
    role.save
end
