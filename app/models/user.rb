# frozen_string_literal: true

class User < ApplicationRecord
  include Clearance::User
  has_many(:user_spaces)
  has_many(:spaces, through: :user_spaces)
  enum(role: {normal: 0, admin: 10})

  def to_s
    name || email
  end

  def initials
    User.initials(name)
  end

  def space
    spaces.includes(:contacts).first
  end
end
