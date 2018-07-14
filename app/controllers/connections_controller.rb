# frozen_string_literal: true

class ConnectionsController < ApplicationController
  before_action(:require_login)
  def update; end

  def show
    @location = current_user.locations.find(params[:location_id])
    @connection = @location.connections.find(params[:id])
  end

  private

  def connection_params
    params.require(:connection).permit(:data)
  end
end
