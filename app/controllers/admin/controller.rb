class Admin::Controller < ApplicationController

  before_filter :authenticate_user!
  before_filter :require_admin_user

end
