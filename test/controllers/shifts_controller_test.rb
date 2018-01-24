require 'test_helper'

class ShiftsControllerTest < ActionDispatch::IntegrationTest
  test 'should require login' do
    patch(account_shift_path(shifts(:one)), xhr: true)
    assert_response(401)
  end
end
