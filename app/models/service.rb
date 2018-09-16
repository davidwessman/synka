# frozen_string_literal: true

class Service < ApplicationRecord
  belongs_to(:user)
  has_many(:connections, dependent: :destroy)
  has_many(:authentications, dependent: :destroy)
  enum(kind: { local: 0, facebook: 10 })

  def authenticate(auth)
    service(nil).authenticate(auth)
  end

  def authenticate?
    active.nil? && permission_url.present?
  end

  def push(connection, new_week)
    update_shifts(connection, new_week) && service(connection).push
  end

  def pull(connection)
    return true if local?
    week = service(connection).pull
    update_shifts(connection, week)
  end

  def permission_url
    Service.kind(kind).permission_url(self)
  end

  def self.kind(kind)
    case kind.to_s
    when 'facebook'
      FacebookService
    else
      LocalService
    end
  end

  def self.unused(services)
    kinds = Service.kinds.keys - services.pluck(:kind)
    kinds.map { |kind| Service.new(kind: kind) }
  end

  private

  def service(connection)
    Service.kind(kind).new(self, connection)
  end

  def update_shifts(connection, week)
    Connection.transaction do
      connection.shifts.each(&:destroy!)
      week.shifts.each do |shift|
        shift.update!(connection: connection)
      end
    end
    true
  rescue ActiveRecord::RecordInvalid => exception
    puts(exception)
    false
  end
end
