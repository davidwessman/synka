# frozen_string_literal: true

class ConnectionsController < ApplicationController
  before_action(:require_login)
  def update
  end

  private

  def connection_params
    params.require(:connection).permit(:data)
  end
end
