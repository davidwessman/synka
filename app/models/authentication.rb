# frozen_string_literal: true

class Authentication < ApplicationRecord
  belongs_to(:service)
  enum(status: {pending: 0, success: 10, failed: 20, rescheduled: 30})
end
