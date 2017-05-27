FactoryGirl.define do
  factory :user do
    name "iaia-user"
    nickname "iaia-user"
    before(:create) do |user|
      user.role = Role.where(name: "user").first
    end
  end

  factory :admin, class: User do
    name "iaia-admin"
    nickname "iaia-admin"
    before(:create) do |user|
      user.role = Role.where(name: "admin").first
    end
  end

  factory :role do
  end

  factory :ability do
  end
end
