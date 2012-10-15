class Proposal < ActiveRecord::Base
  belongs_to :user

  scope :accepted, where(:status => 'accepted')

  def name
    self.title
  end
end
