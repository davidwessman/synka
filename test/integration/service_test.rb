# frozen_string_literal: true

require 'test_helper'

class ServiceTest < ActiveSupport::TestCase
  test 'push to local' do
    connection = connections(:local)
    assert(connection.push(week))
    connection.reload
    assert_equal(week.to_h, connection.week.to_h)
  end

  test 'push to facebook' do
    connection = connections(:facebook)
    assert(connection.push(week))
    connection.reload
    assert_equal(week.to_h, connection.week.to_h)
  end

  test 'pull from facebook' do
  end

  def week
    hash = { mon: [['09:00', '15:00']],
             tue: [['09:00', '15:00']],
             wed: [['09:00', '15:00']],
             thu: [['09:00', '15:00']],
             fri: [['09:00', '15:00']],
             sat: [['09:00', '15:00']],
             sun: [['09:00', '15:00']] }
    Week.new(hash: hash)
  end
end
