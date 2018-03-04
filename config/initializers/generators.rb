# frozen_string_literal: true

Rails.application.config.generators.each do |generators|
  generators.assets = false
  generators.helper = false
  generator.javascripts = false
  generator.stylesheets = false
end
