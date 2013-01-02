class SpeakersController < ApplicationController
  def index
    @speakers = Speaker.order("last_name, first_name")
  end

  def show
    @speaker = Speaker.find(params[:id])
  end
end
