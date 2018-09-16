# frozen_string_literal: true

class LocalService
  def initialize(_service, _connection); end

  def push
    true
  end

  def pull
    true
  end

  def self.permission_url(_service)
    false
  end
end
