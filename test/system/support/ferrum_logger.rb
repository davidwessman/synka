# frozen_string_literal: true
class FerrumLogger
  attr_reader :logs

  def initialize
    @logs = []
  end

  # Filter out the noise - I believe Runtime.exceptionThrown and Log.entryAdded
  # are the interesting log methods but there might be others you need
  def puts(log_str)
    _log_symbol, _log_time, log_body_str = log_str.strip.split(" ", 3)
    return if log_body_str.blank?

    log_body = JSON.parse(log_body_str)
    return if %w[Log.entryAdded].exclude?(log_body["method"])

    url = log_body.dig("params", "entry", "url")
    text = log_body.dig("params", "entry", "text")
    level = log_body.dig("params", "entry", "level")
    @logs << { message: "#{url} - #{text}", level: level }
  end

  def truncate
    @logs = []
  end
end
