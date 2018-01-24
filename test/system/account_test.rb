# frozen_string_literal: true

require 'application_system_test_case'

class AccountsTest < ApplicationSystemTestCase
  test 'sign in and visit account' do
    User.create(email: 'david@wessman.co', password: 'passpass')
    visit(sign_in_url)
    fill_in('email', with: 'david@wessman.co')
    fill_in('password', with: 'passpass')
    within('form') do
      click_on('Sign in')
    end

    assert_selector('h1', text: 'WELCOME!')
    click_on('Account')
    assert_selector('h1', text: 'Hello david@wessman.co')
  end
end
