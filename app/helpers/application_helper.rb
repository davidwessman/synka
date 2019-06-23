# frozen_string_literal: true

module ApplicationHelper
  def user_facing_flashes
    flash.to_hash.slice("alert", "error", "notice", "success")
  end

  def flash_css(flash)
    case flash
    when "alert"
      "bg-yellow-800 border-yellow-800 text-grey-800"
    when "error"
      "bg-red-800 border-red-800 text-grey-800"
    when "notice"
      "bg-blue-800 border-blue-800 text-white"
    when "success"
      "bg-green-800 border-green-800 text-green-800"
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

  def sidebar_link(path, active, text: '')
    classes = "inline-block border-t w-full py-4 font-semibold"
    classes += \
      if path.nil?
        " text-gray-light"
      elsif active
        " bg-blue-700 text-white"
      else
        " bg-white text-blue-800 hover:bg-blue-600 hover:text-white"
      end
    link_to(path, class: classes) do
      if block_given?
        yield
      else
        text
      end
    end
  end
end
