# frozen_string_literal: true

class User < ApplicationRecord
  include Clearance::User
  has_many(:services, dependent: :destroy)
  has_many(:locations, dependent: :destroy)
  has_many(:connections, through: :locations)
  enum(role: { normal: 0, admin: 10 })

  def to_s
    email
  end
end
