# frozen_string_literal: true

class LocalService
  def initialize(_service, connection)
    @connection = connection
  end

  def week
    Week.new(shifts: @connection.try(:shifts))
  end

  def update(_week)
    false
  end

  def self.app; end

  def accounts
    []
  end
end
