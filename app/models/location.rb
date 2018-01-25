# frozen_string_literal: true

class Location < ApplicationRecord
  belongs_to(:user)
  has_many(:connections)
  has_many(:shifts, through: :connections)
  validates(:title, presence: true)

  def synced?
    connections.first.to_h == connections.second.to_h
  end
end
