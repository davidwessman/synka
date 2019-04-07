# frozen_string_literal: true

module ApplicationHelper
  def user_facing_flashes
    flash.to_hash.slice("alert", "error", "notice", "success")
  end

  def flash_css(flash)
    case flash
    when "alert"
      "bg-yellow border-yellow text-grey-darkest"
    when "error"
      "bg-red border-red text-grey-darkest"
    when "notice"
      "bg-blue border-blue text-white"
    when "success"
      "bg-green border-green text-green-darkest"
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
    return "" unless time

    I18n.l(time, format: :hour)
  end

  def sidebar_link(text, path, active)
    classes = "inline-block border-t w-full py-4 font-semibold"
    classes += \
      if path.nil?
        " text-grey-light"
      elsif active
        " bg-blue text-white"
      else
        " bg-white text-blue hover:bg-blue-light hover:text-white"
      end
    link_to(text, path, class: classes)
  end
end
