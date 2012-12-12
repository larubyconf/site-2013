class ClicksController < ApplicationController
  def show
    sponsor = Sponsor.find(params[:id])

    click = Click.create!(user_id: current_user.nil? ? nil : current_user.id, sponsor_id: sponsor.id)

    redirect_to sponsor.url
  end
end
