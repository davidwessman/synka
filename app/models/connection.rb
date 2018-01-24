# frozen_string_literal: true

class Connection < ApplicationRecord
  belongs_to(:location)
  has_many(:shifts, -> { order(:from, :day) })
  enum(kind: { local: 0, facebook: 10 })

  def to_s
    kind
  end

  def hours
    return local_connection.hours if local?
    facebook.location_week.all
  end

  private

  def facebook
    account_uid = '124154461721024'
    uid = '199859223905264'
    @facebook ||= FacebookConnection.new(account_uid, uid)
  end
end
