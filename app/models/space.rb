# frozen_string_literal: true

class Space < ApplicationRecord
  has_many(:user_spaces)
  has_many(:users, through: :user_spaces)
  has_many(:contacts)
  enum(status: {awesome: 0})
  validates(:title, presence: true)
end
