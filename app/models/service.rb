# frozen_string_literal: true

class Service < ApplicationRecord
  belongs_to(:user)
  has_many(:connections, dependent: :destroy)
  enum(kind: { local: 0, facebook: 10 })

  def synchronize(connection, week)
    service(connection).update(week)
  end

  def week(connection)
    service(connection).week
  end

  def self.kind(kind)
    case kind.to_s
    when 'facebook'
      FacebookService
    else
      LocalService
    end
  end

  private

  def service(connection)
    Service.kind(kind).new(self, connection)
  end
end
