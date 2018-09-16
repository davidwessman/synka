# frozen_string_literal: true

class Location < ApplicationRecord
  belongs_to(:user)
  has_many(:connections, dependent: :destroy)
  has_many(:shifts, through: :connections)
  enum(status: { unknown: 0, synced: 10, desynced: 20, error: 30 })
  validates(:title, presence: true)

  def check
    update(status_at: Time.current, status: check_status)
    synced?
  end

  private

  def check_status
    return :unknown unless connections.any?
    result = connections.map(&:check).uniq.compact.length == 1
    if result
      :synced
    else
      :desynced
    end
  end
end
