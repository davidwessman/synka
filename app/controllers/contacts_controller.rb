# frozen_string_literal: true

class ContactsController < ApplicationController
  before_action(:require_login)

  def new
    @space = Space.find(params[:space_id])
    @contact = @space.contacts.build
  end

  def create
    space = Space.find(params[:space_id])
    @contact = space.contacts.build(contact_params)

    if @contact.save
      redirect_to(space_contact_path(space, @contact))
    else
      render(:new, status: 422)
    end
  end

  def show
    @space = Space.find(params[:space_id])
    @contact = @space.contacts.find(params[:id])
    @message = @contact.messages.build
    @messages = @contact.messages.order(created_at: :desc)
  end

  def edit
    @space = Space.find(params[:space_id])
    @contact = @space.contacts.find(params[:id])
  end

  def update
    @space = Space.find(params[:space_id])
    @contact = @space.contacts.find(params[:id])
    if @contact.update(contact_params)
      redirect_to(space_contact_path(@space, @contact))
    else
      render(:edit, status: 422)
    end
  end

  private

  def contact_params
    params.require(:contact).permit(:name, :phone, :email)
  end
end
