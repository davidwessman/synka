# frozen_string_literal: true

class LocationsController < ApplicationController
  before_action(:require_login)
  def index
    @locations = current_user.locations
  end

  def show
    @location = Location.includes(connections: :shifts).find(params[:id])
  end

  def update
    @location = Location.find(params[:id])
    render :show
  end
end
