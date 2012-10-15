class NewsItem < ActiveRecord::Base
  attr_accessible :body, :display_date, :expire_date, :headline, :user_id

  belongs_to :user
  
  scope :display, where("display_date < '#{Time.now}'").order('display_date desc')
end
