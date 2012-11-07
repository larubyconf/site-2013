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
end
