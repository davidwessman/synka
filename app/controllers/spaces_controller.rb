# frozen_string_literal: true

class SpacesController < ApplicationController
  before_action(:require_login)
  def index
    @spaces = current_user.spaces.includes(:contacts)
  end

  def show
    @space = Space.includes(:contacts).find(params[:id])
  end

  def update
    @space = Space.find(params[:id])
    render :show
  end
end
