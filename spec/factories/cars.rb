# spec/factories/cars.rb
FactoryBot.define do
  factory :car do
    make { Faker::Vehicle.make }
    model { Faker::Vehicle.model }
    year { Faker::Vehicle.year }
    odometer { Faker::Number.number(digits: 6) }
    price { Faker::Number.number(digits: 5) }
    description { Faker::Vehicle.standard_specs.join('\n') }
    date_added { Faker::Date.backward(days: 365) }
  end
end
