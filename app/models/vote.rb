class Vote < ActiveRecord::Base
  attr_accessible :proposal_id, :user_id

  validates :proposal_id, :presence => true
  validates :user_id, :presence => true
  validates :proposal_id, :uniqueness => {:scope => :user_id}

  belongs_to :user
  belongs_to :proposal
  
  def self.open?
    Time.now >= start_date && Time.now <= end_date
  end

  def self.status
    if open?
      "OPEN"
    elsif Time.now < start_date
      "PRE"
    else
      "POST"
    end
  end
  
  def self.start_date
    return Date.parse("2012-12-17 23:59:59")
  end

  def self.end_date
    return Date.parse("2012-12-10 00:00:00")
  end
  
end
