class Click < ActiveRecord::Base
  attr_accessible :sponsor_id, :user_id

  belongs_to :user

  belongs_to :sponsor
end
