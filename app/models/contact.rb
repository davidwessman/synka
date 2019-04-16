# frozen_string_literal: true

class Contact < ApplicationRecord
  belongs_to(:space)

  def to_s
    name
  end
end
