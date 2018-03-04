# frozen_string_literal: true

require 'test_helper'

class ShiftsControllerTest < ActionDispatch::IntegrationTest
  test 'should require login' do
    shift = shifts(:one)
    patch(account_location_shift_path(shift.connection.location, shift),
          xhr: true)
    assert_response(401)
  end
end
