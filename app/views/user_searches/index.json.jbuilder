# frozen_string_literal: true

json.array! @user_searches, partial: 'user_searches/user_search', as: :user_search
