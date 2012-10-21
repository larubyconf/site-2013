class Admin::UsersController < Admin::Controller
  def index
    @users = User.order("created_at desc")
  end

  def show
    @user = User.find(params[:id])
  end

  def new
    @user = User.find(params[:id])
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])

    if @user.update_attributes(params[:user])
      flash[:success] = "Your changes have been saved."
      redirect_to admin_users_path
    else
      flash[:error] = "We could not save your changes."
      redirect_to edit_admin_user_path(@user)
    end
  end
  
  def destroy
    @user = User.find(params[:id])

    if @user.destroy
      flash[:success] = "The user was deleted."
    else
      flash[:error] = "The user was not deleted."
    end

    redirect_to admin_users_path
  end
end
