# frozen_string_literal: true

class CheckLocationWorker
  include Sidekiq::Worker

  def perform(location_id)
    location = Location.find(location_id)
    ChecksMailer.failed(location).send_later unless location.check
  end
end
