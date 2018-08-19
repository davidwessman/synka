# frozen_string_literal: true

class LocalService
  def initialize(_service, _connection); end

  def push
    true
  end

  def pull
    true
  end

  def permission_url
    false
  end
end
