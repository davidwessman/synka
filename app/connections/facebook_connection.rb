# frozen_string_literal: true

class FacebookConnection
  def initialize(account_uid, connection_uid)
    @app = FacebookConnection.app
    @account_token = account_token(account_uid)
    @page_token = page_token(connection_uid)
  end

  def week
    return @week if @week.present?
    @week = Week.new(hash: from_fb)
  end

  def update(week)
    return false if page.nil?
    data = to_fb(week)
    response = page.put_connections('me', nil, hours: data.to_json)
    response['success'] == true
  end

  def self.app
    return unless (token = ENV.fetch('FB_APP_ACCESS_TOKEN', nil))
    @app = Koala::Facebook::API.new(token)
  end

  private

  # All accounts connected to app
  def accounts
    return [] if @app.nil?
    @app.get_connections('app', 'accounts').map do |a|
      { id: a['id'], access_token: a['access_token'] }
    end
  end

  # Returns account_token for current account
  def account_token(id)
    account = accounts.find { |a| a[:id] == id }
    return nil if account.nil?
    account.fetch(:access_token, nil)
  end

  # All pages connected to current account
  def pages
    return [] if account.nil?
    account.get_connections('me', 'accounts').map do |p|
      { id: p['id'], access_token: p['access_token'] }
    end
  end

  # Returns account_token for current account
  def page_token(id)
    account.get_page_access_token(id)
  end

  def hours
    return if @page_token.nil?
    data = page.get_object('me', fields: 'hours')
    return {} if data.nil?
    data.fetch('hours', {})
  end

  # Converts hours from Facebook into a hash which can be sent to Week
  def from_fb
    return {} unless (data = hours)
    hash = {}
    Week::DAYS.each do |d|
      hash[d] = []
      (1..2).each do |s|
        opening = data.fetch("#{d}_#{s}_open", nil)
        closing = data.fetch("#{d}_#{s}_close", nil)
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
  def page
    return if @page_token.nil?
    @page ||= Koala::Facebook::API.new(@page_token, nil)
  end
end
