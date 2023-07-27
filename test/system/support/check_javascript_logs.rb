# frozen_string_literal: true
module CheckJavascriptLogs
  ALLOWED_EVERYWHERE = [].freeze
  def self.perform(page, allowed_errors)
    all_allowed_errors = (ALLOWED_EVERYWHERE | allowed_errors)
    errors = page.driver.browser.logger.logs
    return if errors.blank?

    errors.each do |error|
      message = error[:message]
      level = error[:level]

      # Skip CSP report
      next if message.include?("[Report Only]")

      case level
      when "error"
        unless all_allowed_errors.any? { |skips| message.include?(skips) }
          raise("SEVERE: javascript error\n#{message}")
        end

        warn("SEVERE: javascript warning")
      else
        warn("WARN: javascript warning")
      end
      warn(message)
    end
  end
end
