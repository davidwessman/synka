# frozen_string_literal: true

class Connection < ApplicationRecord
  belongs_to(:location)
  has_many(:shifts, -> { by_day })
  enum(kind: { local: 0, facebook: 10 })

  def to_s
    kind
  end

  def week
    return local_week if local?
    facebook.week if facebook?
  end

  def hours
    week.all
  end

  def to_h
    week.to_h
  end

  def synchronize(week)
    facebook.update(week) if facebook?
  end

  private

  def local_week
    Week.new(shifts: shifts)
  end

  def facebook
    account_uid = '124154461721024'
    uid = '199859223905264'
    @facebook ||= FacebookConnection.new(account_uid, uid)
  end
end
