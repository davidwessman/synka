# frozen_string_literal: true

class AccountsController < ApplicationController
  before_action(:require_login)
  def show
    @locations = current_user.locations
    @services = current_user.services
  end
end
