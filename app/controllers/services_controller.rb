# frozen_string_literal: true

class ServicesController < ApplicationController
  before_action(:require_login)
  def create
    service = current_user.services.build(service_params)
    service.save!
    redirect_to(account_url)
  end

  def show
    service = current_user.services.find(params[:id])
    auth = service.authentications
                  .build(data: { code: facebook_params.fetch(:code) })
    if auth.save && service.authenticate(auth)
      redirect_to(account_url, notice: t('.success'))
    else
      render(status: 422)
    end
  end

  private

  def service_params
    params.require(:service).permit(:kind)
  end

  def facebook_params
    params.permit(:state, :code)
  end
end
