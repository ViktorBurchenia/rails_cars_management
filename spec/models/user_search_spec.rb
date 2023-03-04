# frozen_string_literal: true

require 'rails_helper'

RSpec.describe UserSearch, type: :model do
  describe 'validations' do
    it { should validate_presence_of(:user_id) }
  end
  describe 'relations' do
    it { is_expected.to belong_to(:user) }
  end
end
