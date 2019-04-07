# frozen_string_literal: true

class Connection < ApplicationRecord
  belongs_to(:location)
  belongs_to(:service)
  has_many(:shifts, -> { by_day }, dependent: :destroy)

  scope(:local, -> { joins(:service).where(services: {kind: :local}) })
  scope(:remote, -> { joins(:service).where.not(services: {kind: :local}) })

  def to_s
    service.kind
  end

  def to_h
    week.to_h
  end

  def check
    service.pull(self)
    week.to_h
  end

  def pull
    service.pull(self)
  end

  def push(new_week)
    service.push(self, new_week)
  end

  def week
    Week.new(shifts: shifts)
  end
end
