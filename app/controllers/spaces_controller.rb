# frozen_string_literal: true

class SpacesController < ApplicationController
  before_action(:require_login)
  def show
    @space = current_user.space
    contact = Contact.where(id: params["contact_id"]).first
    @message = Message.new(contact: contact)
    @messages = if @space
      @space.messages.recent
    else
      Message.none
    end
  end

  def update
    @space = Space.find(params[:id])
    render :show
  end
end
