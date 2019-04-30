# frozen_string_literal: true

require "sidekiq/web"

Rails.application.routes.draw do
  resources(:passwords, controller: "clearance/passwords", only: %i[create new])
  resource(:session, controller: "clearance/sessions", only: [:create])
  resources(:users, controller: "clearance/users",
                    only: Clearance.configuration.user_actions) do
    resource(:password,
      controller: "clearance/passwords",
      only: %i[create edit update])
  end
  get(:new, controller: :sessions, as: :sign_in, path: "sign-in")
  delete(:destroy, controller: :sessions, as: :sign_out,
                   path: "sign-out")

  resource(:account, only: :show) do
    resources(:settings, only: %i[create index show])
  end

  resources(:spaces, only: %i[show update]) do
    resources(:contacts, only: %i[create show edit new update])
  end

  resources(:contacts, only: %i[]) do
    resources(:messages, only: %i[create])
  end

  get(:contact, controller: :presentation, action: :contact)
  get(:about, controller: :presentation, action: :about)
  get(:read_more, controller: :presentation, action: :read_more)
  root(controller: :presentation, action: :index)

  mount(Sidekiq::Web => "/sidekiq")
end
