# frozen_string_literal: true

json.extract! user_search, :id, :make, :model, :year_from, :year_to, :price_from, :price_to, :user_id, :created_at,
              :updated_at
json.url user_search_url(user_search, format: :json)
