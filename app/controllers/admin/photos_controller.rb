class Admin::PhotosController < Admin::Controller
  def index
    @photos = Photo.order("sort_index, created_at")
  end

  def new
    @photo = Photo.new
  end

  def edit
    @photo = Photo.find(params[:id])
  end

  def create
    @photo = Photo.new

    @photo.update_attributes(params[:photo])

    if @photo.save
      flash[:success] = "Your photo was successfully saved."
      redirect_to admin_photos_path
     else
      flash[:error] = "We failed to save your photo."
      redirect_to new_admin_photos_path
    end
  end

  def update
    @photo = Photo.find(params[:id])

    @photo.update_attributes(params[:photo])

    if @photo.save
      flash[:success] = "Your changes were saved successfully."
      redirect_to admin_photos_path
    else
      flash[:error] = "We failed to save your changes."
      redirect_to edit_admin_photo_path(@photo)
    end
  end
end
