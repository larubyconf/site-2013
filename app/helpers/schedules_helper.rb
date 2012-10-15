module SchedulesHelper
  def display_start_time presentation
    if presentation.class.name == "Workshop"
      presentation.presented_at
    else
      presentation.updated_at
    end
  end
end
