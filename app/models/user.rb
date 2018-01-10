# frozen_string_literal: true

class User < ApplicationRecord
  include Clearance::User
  enum(role: { normal: 0, admin: 10 })
end
