# frozen_string_literal: true

class MessagesController < ApplicationController
  before_action(:require_login)

  def create
    @contact = Contact.includes(:space, :messages).find(params[:contact_id])
    @message = @contact.messages.build(message_params)
    @message.user = current_user
    if @message.save && MessageSenderWorker.perform_async(@message.id)
      redirect_to(space_contact_path(@contact.space_id, @contact))
    else
      @messages = @contact.messages.order(created_at: :desc)
      render(template: "contacts/show", status: 422)
    end
  end

  private

  def message_params
    params.require(:message).permit(:content)
  end
end
