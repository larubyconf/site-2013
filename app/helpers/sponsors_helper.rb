module SponsorsHelper
  def display_level level
    level.split("-")[1].titleize
  end

  def sponsor_link sponsor, image_size = :medium
    if sponsor.url
      link_to image_tag(sponsor.logo.url(image_size)), click_path(sponsor), :target => "_blank"
    else
      link_to image_tag(sponsor.logo.url(image_size)), sponsor_path(sponsor)
    end
  end
end
