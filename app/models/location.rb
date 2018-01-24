# frozen_string_literal: true

class Location < ApplicationRecord
  belongs_to(:user)
  has_many(:connections)
  has_many(:shifts, through: :connections)
  validates(:title, presence: true)
end
