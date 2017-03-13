module ApplicationHelper
  def bootstrap_class_for flash_type
    { success: 'alert-success', error: 'alert-danger', notice: 'alert-warning'}[flash_type.to_sym]
  end

  def flash_messages(opts = {})
    flash.map do |msg_type, message|
      render_flash_message(message, msg_type)
    end.join.html_safe
  end

  def render_flash_message(message, msg_type = 'notice')
    content_tag(:div, message, class: "alert #{bootstrap_class_for(msg_type)} alert-dismissible fade show") do
      content_tag(:button, 'x'.html_safe, class: 'close', data: {dismiss: 'alert'}) + message
    end
  end
end
