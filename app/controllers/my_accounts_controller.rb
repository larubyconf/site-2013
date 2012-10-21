class MyAccountsController < ApplicationController
  def show
    
  end

  def edit
    @user = current_user
  end

  def update
    @user = current_user

    @user.update_attributes(params[:user])

    if @user.save
      flash[:success] = "Your changes have been saved."
      redirect_to my_account_path
    else
      flash[:error] = "We were not able to save your changes."
      redirect_to edit_my_account_path
    end
  end
end
