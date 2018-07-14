# frozen_string_literal: true

class LocationsController < ApplicationController
  before_action(:require_login)
  def show
    @location = Location.includes(connections: :service).find(params[:id])
  end

  def update
    @location = Location.find(params[:id])
    render :show
  end
end
