# frozen_string_literal: true

require 'test_helper'

class LocationsControllerTest < ActionDispatch::IntegrationTest
  test 'require login' do
    get(account_locations_url)
    assert_redirected_to(sign_in_url)
  end

  test 'renders users location' do
    sign_in_as(users(:grasklipparservice))
    get(account_locations_url)
  end
end
