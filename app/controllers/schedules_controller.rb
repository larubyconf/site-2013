class SchedulesController < ApplicationController
  def show
    @workshops_thursday = Workshop.day("2013-02-21")
    @workshops_friday = Workshop.day("2013-02-22")
    @presentations = Proposals.approved
  end
end
