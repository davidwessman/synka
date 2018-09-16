# frozen_string_literal: true

class ApplicationMailer < ActionMailer::Base
  require 'digest/sha2'
  include Roadie::Rails::Automatic
  default(from: 'SyncHours <david@wessman.co>')
  layout('mailer')
  helper(EmailHelper)

  protected

  def set_message_id
    str = Time.zone.now.to_i.to_s
    headers['Message-ID'] = "<#{Digest::SHA2.hexdigest(str)}@wessman.co>"
  end
end
