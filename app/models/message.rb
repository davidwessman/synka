# frozen_string_literal: true

class Message < ApplicationRecord
  belongs_to(:contact, optional: false)
  belongs_to(:user, optional: false)

  validates(:content, :user_id, presence: true)
  enum(status: {draft: 0, sent: 10, failed: 20})
end
