# frozen_string_literal: true

class MessagesController < ApplicationController
  before_action(:require_login)

  def create
    @message = Message.new(message_params)
    @message.user = current_user
    if @message.save && MessageSenderWorker.perform_async(@message.id)
      redirect_to(account_path)
    else
      @space = current_user.space
      render(template: "messages/new", status: 422)
    end
  end

  def new
    @space = current_user.space
    @message = Message.new
  end

  private

  def message_params
    params.require(:message).permit(:content, :contact_id)
  end
end
