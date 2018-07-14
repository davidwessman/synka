# frozen_string_literal: true

class PresentationController < ApplicationController
  def index
    @accounts = FacebookService.new(nil, nil).accounts
  end
end
