# frozen_string_literal: true

json.extract! car, :id, :make, :model, :year, :odometer, :price, :description, :created_at, :updated_at
json.url car_url(car, format: :json)
