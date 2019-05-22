# frozen_string_literal: true

require "sidekiq/web"

Rails.application.routes.draw do
  resources(:passwords, controller: "clearance/passwords", only: %i[create new])
  resource(:session, controller: :sessions, only: %i[create])
  resources(:users, controller: "clearance/users",
                    only: Clearance.configuration.user_actions) do
    resource(:password,
      controller: "clearance/passwords",
      only: %i[create edit update])
  end
  get(:new, controller: :sessions, as: :sign_in, path: "sign-in")
  delete(:destroy, controller: :sessions, as: :sign_out,
                   path: "sign-out")

  resource(:account, controller: :spaces, only: %i[show update]) do
    resources(:settings, only: %i[index])
    resources(:contacts, only: %i[index create show edit new update])
    resources(:messages, only: %i[new create])
  end


  namespace(:callbacks) do
    resources(:messages, only: %i[]) do
      post(:status, on: :member)
    end
  end

  get(:about, controller: :presentation, action: :about)
  root(controller: :presentation, action: :index)

  mount(Sidekiq::Web => "/sidekiq")
end
