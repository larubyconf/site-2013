class MainController < ApplicationController
  before_filter :require_admin_user, :only => [:admin]
  def index
    @photos = Photo.order("sort_index, created_at asc")
    @news_items = NewsItem.recent
  end

  def admin
    render :template => 'admin/index'
  end
end
