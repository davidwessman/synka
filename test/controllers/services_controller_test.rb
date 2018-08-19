# frozen_string_literal: true

require 'test_helper'

class ServicesControllerTest < ActionDispatch::IntegrationTest
  test 'require login' do
    post(account_services_url, params: {})
    assert_redirected_to(sign_in_url)
  end

  test 'create local service' do
    sign_in_as(users(:new_user))
    assert_difference('Service.count') do
      post(account_services_url, params: { service: { kind: :local } })
    end
    assert_redirected_to(account_url)
  end

  test 'authenticate facebook service - correct redirect' do
    sign_in_as(users(:grasklipparservice))
    facebook = services(:grasklipp_facebook)
    get(account_url)
    res = Net::HTTP.get_response(URI(facebook.permission_url))
    assert_equal('302', res.code)
    assert_match(account_service_url(facebook), res.header['location'])
  end

  test 'authenticate facebook service - handle incoming from facebook' do
    sign_in_as(users(:grasklipparservice))
    facebook = services(:grasklipp_facebook)
    facebook.update!(remote_uid: '0')
    get(account_service_url(facebook), params: { state: 'facebook',
                                                 code: '123456789' })
    assert_redirected_to(account_url)
    facebook.reload
    authentication = facebook.authentications.last
    assert_equal('123456789', authentication.data['code'])
    assert(authentication.success?)
    assert_equal(FakeFacebook::USER_ID, facebook.remote_uid)
  end
end
