# frozen_string_literal: true

Rails.application.routes.draw do
  root(controller: :presentation, action: :index)
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
  # get(:new, controller: 'clearance/users', as: :sign_up, path: 'registrera')

  resource(:account, only: :show) do
    resources(:locations, only: %i[index show])
    resources(:services, only: %i[index])
  end
end
