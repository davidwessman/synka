# frozen_string_literal: true

class ChecksMailer < ApplicationMailer
  def failed(location_id)
    @location = Location.includes(:user, connections: :shifts).find(location_id)
    mail(to: @location.user.email, subject: I18n.t("checks.failed"))
  end
end
