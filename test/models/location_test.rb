# frozen_string_literal: true

require 'test_helper'

class LocationTest < ActiveSupport::TestCase
  test 'unknown status when no connections' do
    location = Location.create(title: 'Test', user: User.first)
    assert_equal(0, location.connections.count)
    refute(location.check)
    location.reload
    assert(location.unknown?)
  end

  test 'check if synchronized' do
    local = connections(:local)
    fb = connections(:facebook)
    location = local.location
    assert(local.location.check)
    assert_equal(local.location, fb.location)
    Service.new.send(:update_shifts, local, week_sample('10:00', '13:00'))
    fb.push(week_sample) # FakeFacebook always using default sample, 09:00-15:00
    location.reload
    refute(location.check)
    fb.push(week_sample('10:00', '13:00'))
    location.reload
    assert(location.check)
  end
end
