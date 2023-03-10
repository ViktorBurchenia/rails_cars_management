# frozen_string_literal: true

require 'rails_helper'

RSpec.describe User, type: :model do
  describe 'relations' do
    it { is_expected.to have_many(:user_searches) }
  end
end
