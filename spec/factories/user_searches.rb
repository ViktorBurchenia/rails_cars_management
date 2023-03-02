FactoryBot.define do
  factory :user_search do
    user
    make { Faker::Vehicle.make }
    model { Faker::Vehicle.model }
    year_from { Faker::Vehicle.year }
    price_from { Faker::Number.number(digits: 5) }
    user_id { Faker::Number.number(digits: 1) }
  end
end
