# frozen_string_literal: true

class Shift < ApplicationRecord
  belongs_to(:connection)
  validates(:from, :to, presence: true)
  validates(:from, uniqueness: {scope: %i[to connection day]})
  enum(day: {mon: 0, tue: 1, wed: 2, thu: 3, fri: 4, sat: 5, sun: 6})

  scope(:by_day, -> { order(:day, :from) })

  def from_time
    I18n.l(from, format: :hour)
  end

  def to_time
    I18n.l(to, format: :hour)
  end

  def to_s
    "#{from_time}-#{to_time}"
  end

  def to_a
    [from_time, to_time]
  end
end
