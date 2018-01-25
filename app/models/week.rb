# frozen_string_literal: true

class Week
  attr_reader(:all)
  DAYS = %w[mon tue wed thu fri sat sun].freeze

  def initialize(hash: {}, shifts: [])
    @all = {}
    @all = from_hash(hash) if hash.any?
    @all = from_shifts(shifts) if shifts.any?
  end

  def to_h
    @all.transform_values { |ss| ss.map(&:to_a) }
  end

  private

  def from_hash(hash)
    week = {}
    DAYS.each { |d| week[d] = day(hash.fetch(d, [])) }
    week
  end

  def day(arr)
    arr.map { |t| Shift.new(from: t.first, to: t.second) }
  end

  def from_shifts(shifts)
    week = shifts.group_by(&:day)
    DAYS.each { |d| week[d] = week[d] || [] }
    week
  end
end
