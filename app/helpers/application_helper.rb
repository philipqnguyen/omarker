module ApplicationHelper
  def flash_class(level) # translate the rails flash levels to zurb classes
    case level
    when :notice then 'info'
    when :success then 'success'
    when :error then 'error'
    when :alert then 'warning'
    end
  end
end
