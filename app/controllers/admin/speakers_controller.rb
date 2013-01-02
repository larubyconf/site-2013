class Admin::SpeakersController < ApplicationController
  def index
    @speakers = Speaker.order("last_name, first_name")
  end

  def edit
    @speaker = Speaker.find(params[:id])
  end

  def update
    @speaker = Speaker.find(params[:id])

    @speaker.update_attributes(params[:speaker])

    if @speaker.save
      redirect_to admin_speakers_path
    else
      redirect_to edit_admin_speaker_path(@speaker)
    end
    
  end

  def create
    @speaker = Speaker.new

    @speaker.update_attributes(params[:speaker])

    if @speaker.save
      redirect_to admin_speaker_path(@speaker)
    else
      render :template => 'new'
    end
  end
  
  def new
    @speaker = Speaker.new
  end

  def show
    @speaker = Speaker.find(params[:id])
  end

  def destroy
    @speaker = Speaker.find(params[:id])

    if @speaker.destroy
      flash[:success] = "'#{@speaker.full_name}' has been deleted from the speaker list"
    else
      flash[:error] = "We were unable to delete '#{@speaker.full_name}' from the speaker list."
    end

    redirect_to admin_speakers_path
  end
end
