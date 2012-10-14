class SponsorsController < ApplicationController
  def index
    @sponsors = Sponsor.all
  end
  
  def show
    @sponsor = Sponsor.find(params[:id])
  end

  def edit
    @sponsor = Sponsor.find(params[:id])
    if current_user && (current_user == @sponsor.primary_contact || current_user.admin?)
      #
    else
      flash[:error] = "You do not have permission to edit this sponsor."
      redirect_to root_path
    end
  end

  def update
    @sponsor = Sponsor.find(params[:id])

    @sponsor.update_attributes(params[:sponsor])

    if @sponsor.save
      flash[:success] = "Your changes were successfully saved."
    else
      flash[:error] = "Your changes were not saved."
    end

    redirect_to root_path
  end
end
