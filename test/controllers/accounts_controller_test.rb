# frozen_string_literal: true

require 'test_helper'

class AccountsControllerTest < ActionDispatch::IntegrationTest
  test 'require login' do
    get(account_url)
    assert_redirected_to(sign_in_url)
  end

  test 'renders users account' do
    sign_in_as(users(:grasklipparservice))
    get(account_url)
    assert_response(:success)
  end
end
