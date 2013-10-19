module ApplicationHelper
  ##
  # this method takes a type (normally a flash message type) of the standard
  # rails convention and translates it into TB (Twitter Bootstrap) parlance
  # for proper handling within the CSS
  def tb_type type
    case type
    when :alert
      "alert-block"
    when :error
      "alert-error"
    when :notice
      "alert-info"
    when :success
      "alert-success"
    else
      type.to_s
    end
  end

  ##
  # this method takes a label and a value and displays it with the
  # appropriate divs, etc.. for inclusion on a form
  def ff_read_only label, value
    content_tag(:label, label, class: "control-label") +
    content_tag(:div,   value, class: "controls display") +
    content_tag(:div,   "",    class: "clear")
  end

  ##
  # this method takes a user and returns the appropriate avatar_url
  def avatar_url user
    if user.avatar_url.present?
      user.avatar_url
    else
      default_url = "#{root_url}assets/guest.png"
      gravatar_id = Digest::MD5::hexdigest(user.email).downcase
      "http://gravatar.com/avatar/#{gravatar_id}.png?s=48&d=#{CGI.escape(default_url)}"
    end
  end
  def seconds_to_words seconds
    seconds = seconds.to_i

    days,    r       = seconds.divmod 86400
    hours,   r       = r.divmod 3600
    minutes, seconds = r.divmod 60

    raw_display = []

    raw_display << "#{days}d"    if days    > 0
    raw_display << "#{hours}h"   if hours   > 0
    raw_display << "#{minutes}m" if minutes > 0
    raw_display << "#{seconds}s" if seconds > 0

    raw_display.join(" ")
  end

  def yes_no value
    value ? "Yes" : "No"
  end

  ##
  # this method takes a date time and displays it appropriately, ie.
  # greater than 1 week ago, show date/time stamp, less than, show
  # time ago in words
  def display_datetime value, skip_words = false
    use_words_or value, '%B %d, %Y %H:%M:%S %P %Z', skip_words
  end

  def display_date value, skip_words = false
    use_words_or value, '%B %d, %Y', skip_words
  end

  def display_short_date value, skip_words = false
    use_words_or value, '%m-%d-%y', skip_words
  end

  def use_words_or value, format, skip_words
    return if  value.nil?
    if (Time.now - value) < (86400*7) && !skip_words
      "#{time_ago_in_words(value)} ago"
    else
      value.strftime(format)
    end
  end
end
