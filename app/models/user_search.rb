# frozen_string_literal: true

class UserSearch < ApplicationRecord
  belongs_to :user
  validates :user_id, presence: true
end
