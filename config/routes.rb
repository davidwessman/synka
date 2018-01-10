# frozen_string_literal: true

Rails.application.routes.draw do
  root(controller: :presentation, action: :index)
end
