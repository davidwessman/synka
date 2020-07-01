# frozen_string_literal: true

class MessagesController < ApplicationController
  before_action(:require_login)

  def index
    @space = current_user.space
    @messages = @space.messages.includes(:contact).recent
    @scoped_messages = {
      today: [],
      yesterday: [],
      last_week: [],
      older: []
    }
    @messages.each do |message|
      if message.created_at > Time.now.beginning_of_day
        @scoped_messages[:today] << message
      elsif message.created_at > Time.now.yesterday
        @scoped_messages[:yesterday] << message
      elsif message.created_at > Time.now.beginning_of_week
        @scoped_messages[:last_week] << message
      else
        @scoped_messages[:older] << message
      end
    end
  end

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
