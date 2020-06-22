# frozen_string_literal: true

class SessionsController < Clearance::SessionsController
  protected
  layout("landing")
  def url_after_create
    account_path
  end
end
