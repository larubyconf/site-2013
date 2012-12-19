class Proposal < ActiveRecord::Base
  attr_accessible :title, :abstract, :target_audience
  
  belongs_to :user

  has_many :votes, :dependent => :destroy
  
  scope :accepted, where(:status => 'accepted')

  scope :most_votes,
  select("proposals.*, count(votes.id) as votes_count").
    group(:title).
    joins("left outer join votes on votes.proposal_id = proposals.id").
    order("votes_count desc")

  def weighted_votes
    votes.map {|vote| 1 * vote.user.vote_weight}.sum
  end
  
  def name
    self.title
  end
end
