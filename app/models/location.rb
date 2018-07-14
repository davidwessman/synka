# frozen_string_literal: true

class Location < ApplicationRecord
  belongs_to(:user)
  has_many(:connections, dependent: :destroy)
  has_many(:shifts, through: :connections)
  validates(:title, presence: true)

  def synced?
    connections.first.to_h == connections.second.to_h
  end

  def synchronize
    local_week = connections.local.first&.week
    return unless local_week
    connections.remote.each do |conn|
      conn.synchronize(local_week)
    end
  end
end
