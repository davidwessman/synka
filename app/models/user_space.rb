# frozen_string_literal: true

class UserSpace < ApplicationRecord
  belongs_to(:user)
  belongs_to(:space)
end
