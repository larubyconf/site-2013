class Admin::UsersController < ApplicationController
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
end
