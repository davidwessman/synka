# frozen_string_literal: true

class User < ApplicationRecord
  include Clearance::User
  has_many(:user_spaces)
  has_many(:spaces, through: :user_spaces)
  enum(role: {normal: 0, admin: 10})

  def to_s
    name || email
  end
end
