module ApplicationHelper

  def flash_class(level)
    case level
    when :success then "success"
    when :notice then "info"
    when :error then "danger"
    when :alert then "warning"
    end
  end

end
