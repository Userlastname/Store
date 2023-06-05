FactoryBot.define do
  factory :user do
    phone_number { Faker::Number.unique.number(digits: 10).to_s }
    email { Faker::Internet.email }
    first_name { Faker::Name.first_name }
    last_name { Faker::Name.last_name }
    password { Faker::Internet.password }
  end
end
