# frozen_string_literal: true

class Car < ApplicationRecord
  validates :make, presence: true
  validates :model, presence: true
  validates :year, presence: true, inclusion: { in: 2000..2023 }
  validates :odometer, presence: true, numericality: { only_integer: true, greater_than_or_equal_to: 0 }
  validates :price, presence: true, inclusion: { in: 1..100_000 }
  validates :description, presence: true, length: { in: 1..5000 }
  validates :date_added, presence: true
end
