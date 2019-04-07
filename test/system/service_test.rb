# frozen_string_literal: true

require "application_system_test_case"

class ServiceTest < ApplicationSystemTestCase
  def setup
    @fb_user = FacebookService.test_users.create(false)
  end

  test "add facebook service" do
    user = users(:new_user)
    sign_in_as(user)
    visit(account_url)
    within(first("div", text: :facebook)) do
      click_on(I18n.t("services.service.add"))
    end
    facebook = window_opened_by {
      within(first("div", text: :facebook)) do
        click_on(I18n.t("services.service.authenticate"))
      end
    }
    within_window(facebook) do
      begin
        within(find("#loginform")) do
          fill_in("email", with: @fb_user["email"])
          fill_in("pass", with: @fb_user["password"])
          first("#loginbutton").click
        end
      rescue
        skip
      end

      find('button[name="__CONFIRM__"]').click
    end
    user.reload
    assert_equal(@fb_user["id"], user.services.facebook.first.remote_uid)
  end
end
