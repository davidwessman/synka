# frozen_string_literal: true

class Hour
  def initialize(str)
    @time = Time.parse(str)
  end

  def to_s
    I18n.l(@time, format: '%H:%M')
  end
end
