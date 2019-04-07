# frozen_string_literal: true

require "test_helper"

class ConnectionsControllerTest < ActionDispatch::IntegrationTest
  test "require login" do
    connection = connections(:local)
    patch(account_location_connection_path(connection.location, connection),
      params: {connection: {data: "{}"}})
    assert_redirected_to(sign_in_url)
  end
end
