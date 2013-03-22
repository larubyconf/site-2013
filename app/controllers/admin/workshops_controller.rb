class Admin::WorkshopsController < Admin::Controller
  def index
    @workshops = Workshop.all
  end

  def show
    @workshop = Workshop.find(params[:id])
  end

  def edit
    @workshop = Workshop.find(params[:id])
  end

  def destroy
    @workshop = Workshop.find(params[:id])

    if @workshop.destroy
      flash[:success] = "The workshop was sucessfully deleted."
    else
      flash[:error] = "Unable to delete the workshop at this time."
    end

    redirect_to admin_workshops_path
  end

  def new
    @workshop = Workshop.new
  end

  def update
    @workshop = Workshop.find(params[:id])

    @workshop.update_attributes(params[:workshop])

    if @workshop.save
      flash[:success] = "The workshop was succesfully updated."
      redirect_to admin_workshops_path
    else
      flash[:error] = "Unable to save your changes"
      render :template => 'edit'
    end
  end
end
