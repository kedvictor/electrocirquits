module ApplicationHelper
  
  def colorize_activity activity_text, inactivity_text, activity
    if activity
      return "<span class='text-success'>#{activity_text}</span>"
    else
      return "<span class='text-danger'>#{inactivity_text}</span>"
    end
  end
  
end
