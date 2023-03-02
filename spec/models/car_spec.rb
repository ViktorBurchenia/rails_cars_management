# spec/models/car_spec.rb
require 'rails_helper'

RSpec.describe Car, type: :model do
  describe "validations" do
    it { should validate_presence_of(:make) }
    it { should validate_presence_of(:model) }
    it { should validate_presence_of(:year) }
    it { should validate_numericality_of(:odometer).only_integer.is_greater_than_or_equal_to(0) }
    it { should validate_presence_of(:price) }
    it { should validate_inclusion_of(:price).in_range(1..100_000) }
    it { should validate_presence_of(:description) }
    it { should validate_length_of(:description).is_at_least(1).is_at_most(5000) }
    it { should validate_presence_of(:date_added) }
  end
end
