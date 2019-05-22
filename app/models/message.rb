# frozen_string_literal: true

class Message < ApplicationRecord
  belongs_to(:contact, optional: false)
  belongs_to(:user, optional: false)

  validates(:content, :user_id, presence: true)
  enum(status: {draft: 0, processed: 10, sent: 20, delivered: 30, failed: 40})
  scope(:recent, -> { order(created_at: :desc).limit(5) })

  def delivery_status(params)
    return false if delivery["MessageSid"] != params["MessageSid"]
    delivery["MessageStatus"] = params["MessageStatus"]
    delivery["updated_at"] = Time.zone.now
    self.status = :sent if params["MessageStatus"] == "sent"
    self.status = :delivered if params["MessageStatus"] == "delivered"

    save
  end
end
