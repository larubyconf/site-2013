class WorkshopsController < ApplicationController
  def index
    @workshops = Workshop.order(:presented_at)
  end

  def show
    @workshop = Workshop.find(params[:id])
  end
end
