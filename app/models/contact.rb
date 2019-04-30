# frozen_string_literal: true

class Contact < ApplicationRecord
  belongs_to(:space)
  has_many(:messages)

  def to_s
    name
  end
end
