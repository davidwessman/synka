# frozen_string_literal: true

require 'sinatra/base'
require 'json'

class FakeFacebook < Sinatra::Base
  USER_ID = ENV.fetch('FB_USER_ID', '123456789')
  PAGE_ID = ENV.fetch('FB_PAGE_ID', '123456789')
  TOKEN = '987654321'

  get '/oauth/access_token' do
    content_type(:json)
    if params['code']
      status(200)
      { access_token: TOKEN }.to_json
    else
      puts(params)
      status(544)
    end
  end

  post '/oauth/access_token' do
    status(200)
    ''
  end

  # https://developers.facebook.com/tools/explorer/?method=GET&path=app%2Faccounts&version=v3.0
  get '/app/accounts' do
    content_type(:json)
    status(200)
    { data: [{ id: USER_ID, access_token: TOKEN }] }.to_json
  end

  get '/me/accounts' do
    content_type(:json)
    status(200)
    { data: [{ id: PAGE_ID, access_token: TOKEN }] }.to_json
  end

  get '/me/' do
    content_type(:json)
    status(200)
    me = { "name": 'David Wessman', id: USER_ID }
    if params['fields']
      me['accounts'] = { data: [{ id: PAGE_ID,
                                  hours: week_sample }] }
    end
    me.to_json
  end

  post '/me/' do
    if params['hours']
      status(200)
      { success: true }.to_json
    else
      puts(params)
      status(500)
    end
  end

  get '/dialog/oauth' do
    if params['redirect_uri']
      redirect_url = params['redirect_uri'] + "?state=\"#{params[:state]}\"" \
        "&code=#{TOKEN}"
      redirect(redirect_url)
    else
      puts(params)
      status(544)
    end
  end

  get '/:id' do
    if params['access_token']
      status(200)
      { access_token: TOKEN }.to_json
    else
      puts(params)
      status(544)
    end
  end

  get '/*' do
    puts('GET')
    puts(params)
    puts(request.path_info)
    status(544)
  end

  post '/*' do
    puts('GET')
    puts(params)
    puts(request.path_info)
    status(544)
  end

  # get '/me/:organization/:project/contributors' do
  #   json_response(200, 'contributors.json')
  # end

  private

  def week_sample(from = '09:00', to = '15:00')
    hash = { mon: [[from, to]],
             tue: [[from, to]],
             wed: [[from, to]],
             thu: [[from, to]],
             fri: [[from, to]],
             sat: [[from, to]],
             sun: [[from, to]] }
    Week.new(hash: hash)
  end

  def json_response(response_code, file_name)
    content_type(:json)
    status(response_code)
    File.open(File.dirname(__FILE__) + '/fixtures/' + file_name, 'rb').read
  end
end
