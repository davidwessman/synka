# frozen_string_literal: true

class ApplicationRecord < ActiveRecord::Base
  self.abstract_class = true

  def self.initials(text)
    initials = ""
    if text
      initials = (text.split - ["AB"]).map(&:first).join.strip
    end
    if initials == ""
      initials = "?"
    end
    initials.upcase
  end
end
