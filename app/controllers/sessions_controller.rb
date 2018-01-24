# frozen_string_literal: true

class SessionsController < Clearance::SessionsController
  protected

  def url_after_create
    account_path
  end
end
