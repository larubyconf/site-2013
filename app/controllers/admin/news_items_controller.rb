class Admin::NewsItemsController < Admin::Controller
  def index
    @news_items = NewsItem.order("display_date desc, created_at desc")
  end

  def new
    @news_item = NewsItem.new
  end

  def edit
    @news_item = NewsItem.find(params[:id])
  end

  def create
    @news_item = NewsItem.new

    @news_item.update_attributes(params[:news_item])

    @news_item.user = current_user

    if @news_item.save
      flash[:success] = "Your news item was successfully created."
      redirect_to admin_news_items_path
    else
      flash[:error] = "Your changes were not saved."
      redirect_to new_admin_news_item_path(@news_item)
    end    
  end

  def update
    @news_item = NewsItem.find(params[:id])

    @news_item.update_attributes(params[:news_item])

    if @news_item.save
      flash[:success] = "Your changes to the news item were successfully saved."
      redirect_to admin_news_items_path
    else
      flash[:error] = "Your changes were not saved."
      redirect_to edit_admin_news_item_path(@news_item)
    end
  end

  def show
    @news_item = NewsItem.find(params[:id])
  end
end
