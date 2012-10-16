class NewsItemsController < ApplicationController
  def index
    @news_items = NewsItem.display
  end

  def show
    @news_item = NewsItem.find(params[:id])
    @news_item.increment_views!
  end
end
