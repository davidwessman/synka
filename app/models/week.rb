# frozen_string_literal: true

class Week
  attr_reader(:all)

  def initialize(week)
    @all = {}
    %i[mon tue wed thu fri sat sun].each do |d|
      all[d] = day(week.fetch(d, []))
    end
  end

  private

  def day(arr)
    arr.map { |t| Shift.new(from: t.first, to: t.second) }
  end
end
