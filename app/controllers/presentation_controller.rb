# frozen_string_literal: true

class PresentationController < ApplicationController
  def index
    @accounts = Facebook.accounts
    @pages = Facebook.pages(@accounts.first.second)
    @hours = Facebook.hours(@pages.first.fetch('access_token', nil)) || []
  end
end
