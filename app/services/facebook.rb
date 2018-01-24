# frozen_string_literal: true

class Facebook
  attr_reader(:app)

  def initialize
    token = ENV.fetch('FB_APP_ACCESS_TOKEN', nil)
    @app = Koala::Facebook::API.new(token) unless token.nil?
  end

  def accounts
    return [] if @app.nil?
    app.get_connections('app', 'accounts').map do |a|
      { id: a['id'], access_token: a['access_token'] }
    end
  end

  def self.account_token(id)
    accounts.select { |a| a[:id] == id }
  end

  def pages(user_token)
    return if user_token.nil?
    graph = Koala::Facebook::API.new(user_token, nil)
    graph.get_connections('me', '', fields: ['accounts{id, access_token, hours}']).to_h
  end

  def hours(user_token)
    return if user_token.nil?
    graph = Koala::Facebook::API.new(user_token)
    connections = graph.get_connections('me', '', fields: ['accounts{id, hours}']).to_h
    connections.deep_symbolize_keys!
    connections.fetch(:accounts).fetch(:data)
  end
end
