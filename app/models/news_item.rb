class NewsItem < ActiveRecord::Base
  attr_accessible :body, :display_date, :expire_date, :headline, :user_id
end
