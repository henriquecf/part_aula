module ApplicationHelper
  def foundation_alert(message, opts = {})
    opts = opts.select { |k, v| k == :type || key == :style }
    alert_class = (['alert-box'] + opts.values).join(" ")
    "<div data-alert class='#{alert_class}'>#{message}<a href='#' class='close'>&times;</a></div>".html_safe
  end
end
