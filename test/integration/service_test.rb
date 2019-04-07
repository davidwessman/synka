# frozen_string_literal: true

require "test_helper"

class ServiceTest < ActiveSupport::TestCase
  test "push to local" do
    connection = connections(:local)
    assert(connection.push(week_sample))
    connection.reload
    assert_equal(week_sample.to_h, connection.week.to_h)
  end

  test "push to facebook" do
    connection = connections(:facebook)
    assert(connection.push(week_sample))
    connection.reload
    assert_equal(week_sample.to_h, connection.week.to_h)
  end
end
