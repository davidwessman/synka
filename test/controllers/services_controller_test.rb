# frozen_string_literal: true

require 'test_helper'

class ServicesControllerTest < ActionDispatch::IntegrationTest
  test 'require login' do
    get(account_services_url)
    assert_redirected_to(sign_in_url)
  end

  test 'renders user services' do
    sign_in_as(users(:grasklipparservice))
    get(account_services_url)
  end
end
