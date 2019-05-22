# frozen_string_literal: true

class Space < ApplicationRecord
  has_many(:user_spaces)
  has_many(:users, through: :user_spaces)
  has_many(:contacts)
  has_many(:messages, through: :contacts)
  enum(status: {awesome: 0})
  validates(:title, presence: true)

  def to_s
    title
  end
end
