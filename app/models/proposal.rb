class Proposal < ActiveRecord::Base
  attr_accessible :title, :abstract, :target_audience, :presented_at,
  :duration
  
  belongs_to :user

  has_many :votes, :dependent => :destroy

  has_many :presenters, :dependent => :destroy

  has_many :speakers, :through => :presenters
  
  acts_as_commentable
  
  scope :accepted, where(:status => 'accepted')

  scope :rejected, where(:status => 'rejected')

  scope :considered, where(:status => 'considered')

  scope :to_review, where("status is null or status = ''")

  scope :confirmed, where(:status => 'confirmed')
  
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

  def next
    Proposal.where("id > ?", id).first 
  end

  def prev
    Proposal.where("id < ?", id).last
  end
end
