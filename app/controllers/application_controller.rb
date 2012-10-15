class ApplicationController < ActionController::Base
  protect_from_forgery

  def require_admin_user
    if current_user.admin?
      true
    else
      flash[:error] = "You do not have permission to access that."
      redirect_to root_path()
    end
  end

end
