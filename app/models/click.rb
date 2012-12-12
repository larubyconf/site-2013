class Click < ActiveRecord::Base
  attr_accessible :sponsor_id, :user_id, :referer

  belongs_to :user

  belongs_to :sponsor
end
