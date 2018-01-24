# frozen_string_literal: true

class ShiftsController < ApplicationController
  before_action(:require_login)
  def create
    @location = current_user.locations.find(params[:location_id])
    @connection = @location.connections
                           .find(shift_params.fetch(:connection_id))
    @shift = @connection.shifts.build(shift_params)
    render(:error, status: 422) unless @shift.save
  end

  def update
    @location = current_user.locations.find(params[:location_id])
    @connection = @location.connections
                           .find(shift_params.fetch(:connection_id))
    @shift = @connection.shifts.find(params[:id])
    render(:error, status: 422) unless @shift.update(shift_params)
  end

  # @id = ActionView::RecordIdentifier.dom_id()
  private

  def shift_params
    params.require(:shift).permit(:connection_id, :day, :from, :to)
  end
end
