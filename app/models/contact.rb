# frozen_string_literal: true

class Contact < ApplicationRecord
  belongs_to(:space)
  has_many(:messages)

  def to_s
    name
  end

  def initials
    Contact.initials(name)
  end

  def get_value(key)
    if key == :name
      name
    end
  end
end
