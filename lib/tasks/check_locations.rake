# frozen_string_literal: true

namespace :check do
  desc("Check all locations")
  task(locations: :environment) do
    Location.find_each { |loc| CheckLocationWorker.perform_async(loc) }
  end
end
