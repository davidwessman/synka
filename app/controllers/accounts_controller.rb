# frozen_string_literal: true

class AccountsController < ApplicationController
  before_action(:require_login)
  def show
    @spaces = current_user.spaces.includes(:contacts)
  end

  def index
  end
end
