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

  def sidebar_link(action, url, css: "mt-2 -mx-3 px-3 py-2 flex items-center justify-between hover:text-gray-900 hover:bg-gray-100 text-sm rounded-md text-gray-600", active_css: "bg-gray-100 hover:bg-gray-100 text-gray-900")
    if sidebar_active?(action)
      css = "#{css} #{active_css}"
    end
    link_to(url, class: css) do
      yield
    end
  end

  def sidebar_active?(action)
    unless action.is_a?(Array)
      action = [action]
    end

    case action.length
    when 1
      controller_name.to_s == action[0].to_s
    when 2
      (controller_name.to_s == action[0].to_s &&
              action_name.to_s == action[1].to_s)
    else
      false
    end
  end
end
