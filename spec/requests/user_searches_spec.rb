# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'UserSearches', type: :request do
  describe 'POST #create' do
    let!(:user) { create(:user) }
    let(:current_user_id) { user.id }
    let(:user_search_params) { { user_search: { make: 'Ford', model: 'Fiesta', user_id: current_user_id } } }

    context ' user create search' do
      it 'create new search' do
        expect do
          post '/user_searches', params: user_search_params
        end.to change(UserSearch, :count).by(1)
      end
    end
  end
end
