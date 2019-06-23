# frozen_string_literal: true

class ContactsController < ApplicationController
  before_action(:require_login)

  def new
    @contact = current_user.space.contacts.build
  end

  def create
    @contact = current_user.space.contacts.build(contact_params)

    if @contact.save
      redirect_to(account_contact_path(@contact))
    else
      render(:new, status: 422)
    end
  end

  def show
    @contact = current_user.space.contacts.find(params[:id])
    @message = @contact.messages.build
    @messages = @contact.messages.order(created_at: :desc).limit(5)
  end

  def edit
    @contact = current_user.space.contacts.find(params[:id])
  end

  def update
    @contact = current_user.space.contacts.find(params[:id])
    if @contact.update(contact_params)
      redirect_to(account_contact_path(@contact))
    else
      render(:edit, status: 422)
    end
  end

  def index
    @space = current_user.space
  end

  private

  def contact_params
    params.require(:contact).permit(:name, :phone, :email)
  end
end
