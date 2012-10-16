class Admin::SponsorsController < ApplicationController
  def index
    @sponsors = Sponsor.all
  end

  def new
    @sponsor = Sponsor.new
  end

  def edit
    @sponsor = Sponsor.find(params[:id])
  end

  def show
    @sponsor = Sponsor.find(params[:id])
  end

  def create
    @sponsor = Sponsor.new

    @sponsor.update_attributes(params[:sponsor])

    if @sponsor.save
      flash[:success]="Your new sponsor was successfully created."
      redirect_to admin_sponsors_path
    else
      flash[:error] = "Your new sponsor was not saved."
      redirect_to new_admin_sponsor_path
    end
  end

  def update
    @sponsor = Sponsor.find(params[:id])

    @sponsor.update_attributes(params[:sponsor])

    if @sponsor.save
      flash[:success]="Your changes were successfully saved."
      redirect_to admin_sponsors_path
    else
      flash[:error] = "Your changes were not saved."
      redirect_to edit_admin_sponsor_path
    end
  end    
end
