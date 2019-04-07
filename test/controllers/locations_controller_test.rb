# frozen_string_literal: true

require "test_helper"

class LocationsControllerTest < ActionDispatch::IntegrationTest
  test "require login" do
    get(account_location_url(locations(:store)))
    assert_redirected_to(sign_in_url)
  end

  test "renders user location" do
    sign_in_as(users(:grasklipparservice))
    get(account_location_url(locations(:store)))
    assert_response(:success)
  end
end
