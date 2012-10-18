module SchedulesHelper
  def display_start_time presentation
    if presentation.class.name == "Workshop"
      presentation.presented_at.strftime("%I:%M %p")
    else
      presentation.updated_at.strftime("%I:%M %p")
    end
  end
end
