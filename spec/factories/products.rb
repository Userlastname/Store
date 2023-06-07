FactoryBot.define do
  factory :product do
  name { Faker::Commerce.product_name }
  price { Faker::Commerce.price(range: 10..100) }
  description { Faker::Lorem.sentence }
  category { FactoryBot.create(:category) }
  end
end
