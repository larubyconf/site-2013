class MainController < ApplicationController
  before_filter :require_admin_user, :only => [:admin]
  def index
    @sponsors = Sponsor.order('level asc, sponsored_at asc')
    @photos = Photo.order("sort_index, created_at asc")
    @news_items = NewsItem.display
  end

  def admin
    render :template => 'admin/index'
  end
end
