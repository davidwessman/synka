# frozen_string_literal: true

class FacebookService
  def initialize(service = nil, connection = nil)
    @app = FacebookService.app
    @connection = connection
    @account_token = account_token(service.remote_uid) if service.present?
  end

  def pull
    Week.new(hash: from_fb)
  end

  def push
    return false if page_account.nil?
    data = to_fb(@connection.week)
    response = page_account.put_connections('me', nil, hours: data.to_json)
    response['success'] == true
  end

  def self.app
    return unless (app_id = ENV.fetch('FB_APP_ID', nil))
    return unless (secret = ENV.fetch('FB_APP_SECRET', nil))
    token = Koala::Facebook::OAuth.new(app_id, secret)
    token = token.get_app_access_token
    @app = Koala::Facebook::API.new(token, secret)
  end

  private

  # All accounts connected to app
  def accounts
    return [] if @app.nil?
    @app.get_connections('app', 'accounts',
                         fields: %w[id access_token]).map(&:symbolize_keys)
  end

  # Returns account_token for current account
  def account_token(id)
    accounts.find { |a| a[:id] == id }&.fetch(:access_token, nil)
  end

  # All pages connected to current account
  def pages
    return [] if account.nil?
    return @pages if @pages
    fields = 'accounts{id, access_token, hours}'
    data = account.get_connections('me', '', fields: [fields])
    @pages = data.deep_symbolize_keys.fetch(:accounts)&.fetch(:data)
  end

  def page
    @page = pages.find { |p| p[:id] == @connection.remote_uid }
  end

  # Returns account_token for current account
  def page_token
    return if account.nil? || @connection.nil?
    @page_token = account.get_page_access_token(@connection.remote_uid)
  end

  # Converts hours from Facebook into a hash which can be sent to Week
  def from_fb
    return {} unless (data = page&.fetch(:hours))
    hash = {}
    Week::DAYS.each do |d|
      hash[d] = []
      (1..2).each do |s|
        opening = data.fetch("#{d}_#{s}_open".to_sym, nil)
        closing = data.fetch("#{d}_#{s}_close".to_sym, nil)
        hash[d] << [opening, closing] if opening && closing
      end
    end
    hash
  end

  # Converts Week to hash which can be sent to Facebook
  def to_fb(week)
    week_hash = week.to_h
    hash = {}
    week_hash.each do |day, shifts|
      shifts.first(2).each_with_index do |s, i|
        hash["#{day}_#{i + 1}_open"] = s.first
        hash["#{day}_#{i + 1}_close"] = s.second
      end
    end
    hash
  end

  # Facebook Graph API call with user account
  def account
    return if @account_token.nil?
    @account ||= Koala::Facebook::API.new(@account_token, nil)
  end

  # Facebook Graph API call with page
  def page_account
    return if page_token.nil?
    @page_account ||= Koala::Facebook::API.new(page_token, nil)
  end
end
