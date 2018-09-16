# frozen_string_literal: true

class ChecksController < ApplicationController
  before_action(:require_login)

  def create
    location = current_user.locations.find(params[:location_id])
    CheckLocationWorker.perform_async(location.id)
    redirect_to(account_location_url(location), notice: t('.queued'))
  end
end
