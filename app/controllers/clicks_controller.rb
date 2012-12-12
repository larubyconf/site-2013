class ClicksController < ApplicationController
  def show
    sponsor = Sponsor.find(params[:id])

    referer = request.env["HTTP_REFERER"] || 'none'
    
    click = Click.create!(user_id: current_user.nil? ? nil : current_user.id, sponsor_id: sponsor.id, referer: referer)

    redirect_to sponsor.url
  end
end
