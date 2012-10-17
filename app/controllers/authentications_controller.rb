class AuthenticationsController < ApplicationController
  def create
    # render :text => request.env["omniauth.auth"].to_yaml
    auth = request.env["omniauth.auth"]
    current_user.authentications.create(
                                        :provider => auth['provider'],
                                        :uid => auth['uid'])
    flash[:notice] = "Authentication successful."
    redirect_to authentications_url
  end

  def index
  end

  def destroy
  end
end
