# frozen_string_literal: true

class Message < ApplicationRecord
  belongs_to(:contact)
  enum(status: {draft: 0, sent: 10, failed: 20})
end
