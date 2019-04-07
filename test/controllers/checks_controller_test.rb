# frozen_string_literal: true

require "test_helper"

class ChecksControllerTest < ActionDispatch::IntegrationTest
  test "require login" do
    post(account_location_checks_path(locations(:store)))
    assert_redirected_to(sign_in_url)
  end

  test "must be owner of location" do
    sign_in_as(users(:new_user))
    assert_raises(ActiveRecord::RecordNotFound) do
      post(account_location_checks_path(locations(:store)))
    end
  end

  test "queue up check for location" do
    sign_in_as(users(:grasklipparservice))
    assert_equal(0, CheckLocationWorker.jobs.size)
    post(account_location_checks_path(locations(:store)))
    assert_equal(1, CheckLocationWorker.jobs.size)
    assert_redirected_to(account_location_url(locations(:store)))
  end
end
