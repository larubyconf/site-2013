class NewsItem < ActiveRecord::Base
  attr_accessible :body, :display_date, :expire_date, :headline, :user_id

  belongs_to :user
  
  scope :display, where("display_date < '#{Time.now}' and (expire_date is null or expire_date > '#{Time.now}')").order('display_date desc')

  scope :recent, display.limit(4)

  def increment_views!
    self.views += 1
    self.save
  end
end
