class Vote < ActiveRecord::Base
  attr_accessible :proposal_id, :user_id

  validates :proposal_id, :presence => true
  validates :user_id, :presence => true
  validates :proposal_id, :uniqueness => {:scope => :user_id}

  belongs_to :user
  belongs_to :proposal
  
end
