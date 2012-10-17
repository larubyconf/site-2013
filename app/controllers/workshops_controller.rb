class WorkshopsController < ApplicationController
  def index
    @workshops = Workshop.order(:presented_at)
  end
end
