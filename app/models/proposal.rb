class Proposal < ActiveRecord::Base
  attr_accessible :title, :abstract, :target_audience
  
  belongs_to :user

  scope :accepted, where(:status => 'accepted')

  def name
    self.title
  end
end
