# frozen_string_literal: true

class Facebook
  def self.accounts
    app.get_connections('app', 'accounts').map do |a|
      [a['id'], a['access_token']]
    end
  end

  def self.get_account_pages(_user_id)
    all_accounts = accounts
  end

  def self.pages(account_token)
    return if account_token.nil?
    graph = Koala::Facebook::API.new(account_token, nil)
    graph.get_connections('me', 'accounts', fields: ['accounts{id, access_token, hours}'])
  end

  def self.hours(access_token)
    return if access_token.nil?
    page = Koala::Facebook::API.new(access_token)
    result = page.get_object('me?fields=hours')
    result.fetch('hours', {})
  end

  def self.app
    @graph ||= Koala::Facebook::API.new(ENV.fetch('FB_APP_ACCESS_TOKEN'))
  end
end
