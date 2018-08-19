# frozen_string_literal: true

class AccountsController < ApplicationController
  before_action(:require_login)
  def show
    @locations = current_user.locations.includes(:connections)
    @services = current_user.services
    @unused_services = Service.unused(current_user.services)
  end
end
