# frozen_string_literal: true

Rails.application.routes.draw do
  resources(:passwords, controller: 'clearance/passwords', only: %i[create new])
  resource(:session, controller: 'clearance/sessions', only: [:create])
  resources(:users, controller: 'clearance/users',
                    only: Clearance.configuration.user_actions) do
    resource(:password,
             controller: 'clearance/passwords',
             only: %i[create edit update])
  end
  get(:new, controller: :sessions, as: :sign_in, path: 'sign-in')
  delete(:destroy, controller: :sessions, as: :sign_out,
                   path: 'sign-out')

  resource(:account, only: :show) do
    resources(:locations, only: %i[index show update]) do
      resources(:checks, only: %i[create])
      resources(:connections, only: %i[show update])
      resources(:shifts, only: %i[create update destroy])
    end
    resources(:services, only: %i[create show])
  end

  get(:oauth, controller: :presentation, action: :index)

  root(controller: :presentation, action: :index)
end
