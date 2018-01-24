# frozen_string_literal: true

class LocationsController < ApplicationController
  before_action(:require_login)
  def index
    @locations
  end

  def show
    @location = Location.new
  end
end
