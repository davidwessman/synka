# frozen_string_literal: true

module ApplicationHelper
  def user_facing_flashes
    flash.to_hash.slice('alert', 'error', 'notice', 'success')
  end

  def flash_css(flash)
    case flash
    when 'alert'
      'bg-yellow border-yellow text-grey-darkest'
    when 'error'
      'bg-red border-red text-grey-darkest'
    when 'notice'
      'bg-blue border-blue text-white'
    when 'success'
      'bg-green border-green text-green-darkest'
    end
  end

  def full_title(title, page)
    if page.blank?
      title
    else
      "#{title} | #{page}"
    end
  end

  def title(title)
    provide(:title, title)
    title
  end

  def week_day(day)
    t("time.week_days.#{day}")
  end

  def time_value(time)
    return '' unless time
    I18n.l(time, format: :hour)
  end
end
