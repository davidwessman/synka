# frozen_string_literal: true

class Connection < ApplicationRecord
  belongs_to(:location)
  belongs_to(:service)
  has_many(:shifts, -> { by_day }, dependent: :destroy)

  scope(:local, -> { joins(:service).where(services: { kind: :local }) })
  scope(:remote, -> { joins(:service).where.not(services: { kind: :local }) })

  def to_s
    service.kind
  end

  def hours
    week.all
  end

  def to_h
    week.to_h
  end

  def synchronize(week)
    service.synchronize(self, week)
  end

  def week
    service.week(self)
  end
end
