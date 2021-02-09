# frozen_string_literal: true

require "application_system_test_case"

class AccountsTest < ApplicationSystemTestCase
  test "sign in and visit account" do
    User.create(email: "david@wessman.co", password: "passpass")
    visit(sign_in_url)
    fill_in("email", with: "david@wessman.co")
    fill_in("password", with: "passpass")
    within("form") do
      click_on("Sign in")
    end

    assert_selector("h1", text: I18n.t("presentation.index.sync_your"))
    click_on("Account")
    assert_selector("h3", text: I18n.t("presentation.sidebar.welcome"))
    assert_selector("h3", text: "Not to be found")
  end
end
