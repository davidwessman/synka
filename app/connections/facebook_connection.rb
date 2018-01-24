# frozen_string_literal: true

class FacebookConnection
  attr_reader(:app, :hours)

  def initialize(account_uid, connection_uid)
    @app = FacebookConnection.app
    @access_token = account_token(account_uid)
    @connection_uid = connection_uid
    @hours = get_hours(@access_token)
  end

  def to_s
    'Facebook'
  end

  def accounts
    return [] if @app.nil?
    @app.get_connections('app', 'accounts').map do |a|
      { id: a['id'], access_token: a['access_token'] }
    end
  end

  def account_token(id)
    account = accounts.find { |a| a[:id] == id }
    return nil if account.nil?
    account.fetch(:access_token, '')
  end

  # def pages(user_token)
  #   return if user_token.nil?
  #   graph = Koala::Facebook::API.new(user_token, nil)
  #   graph.get_connections('me', '', fields: ['accounts{id, access_token, hours}']).to_h
  # end

  def get_hours(account_token)
    return if account_token.nil?
    graph = Koala::Facebook::API.new(account_token)
    connections = graph.get_connections('me', '', fields: ['accounts{id, name, hours}'])
    connections.deep_symbolize_keys!
    connections.fetch(:accounts).fetch(:data)
  end

  def location_hours
    hours = @hours.find { |a| a[:id] == @connection_uid }
    return [] if hours.nil?
    hours.fetch(:hours)
  end

  def location_week
    return unless (hours = location_hours)
    week = {}
    %i[mon tue wed thu fri sat sun].each do |d|
      week[d] = []
      (1..2).each do |s|
        opening = hours.fetch("#{d}_#{s}_open".to_sym, nil)
        closing = hours.fetch("#{d}_#{s}_close".to_sym, nil)
        week[d] << [opening, closing] if opening && closing
      end
    end
    Week.new(week)
  end

  def self.app
    token = ENV.fetch('FB_APP_ACCESS_TOKEN', nil)
    @app = Koala::Facebook::API.new(token) unless token.nil?
  end
end
