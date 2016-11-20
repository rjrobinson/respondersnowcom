module ApplicationHelper
  def is_active_controller(controller_name)
    params[:controller] == controller_name ? "active" : nil
  end

  def is_active_action(action_name)
    params[:action] == action_name ? "active" : nil
  end

  #
  # def bootstrap_class_for flash_type
  #   {success: "alert-success", error: "alert-danger", alert: "alert-warning", notice: "alert-info"}[flash_type] || flash_type.to_s
  # end

  def flash_messages(opts = {})
    # flash.each do |msg_type, message|
    #   concat(content_tag(:div, message, class: "m-r-sm text-muted welcome-message #{bootstrap_class_for(msg_type)} fade in") do
    #     concat content_tag(:button, 'x', class: "close", data: {dismiss: 'alert', i18n: 'topnav.welcometext'})
    #     concat message
    #   end)
    # end
    # nil
    flash_messages = []
    flash.each do |type, message|
      type = 'success' if type == 'notice'
      type = 'error' if type == 'alert'
      text = "<script>toastr.#{type}('#{message}');</script>"
      flash_messages << text.html_safe if message
    end
    flash_messages.join("\n").html_safe
  end
end