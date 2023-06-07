FactoryBot.define do
  factory :category do
    name { Faker::Name.name }
    position { "1" }
  end
end
