module SchedulesHelper
  def display_start_time presentation
    presentation.presented_at.strftime("%I:%M %p") unless presentation.presented_at.nil?
  end

  def link_to_presentation presentation
    if presentation.class == Workshop
      link_to presentation.name, workshop_path(presentation)
    else
      link_to presentation.name, proposal_path(presentation)
    end
  end
end
