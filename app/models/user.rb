class User < ActiveRecord::Base
  include ActionView::Helpers::TextHelper
  has_many :authentications
  
  # Include default devise modules. Others available are:
  # :token_authenticatable, :confirmable,
  # :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
  :recoverable, :rememberable, :trackable, :validatable,
  :omniauthable

  # Setup accessible (or protected) attributes for your model
  attr_accessible :email, :password, :password_confirmation, :remember_me,
    :opt_out

  has_many :votes

  has_many :proposals_voted_for, :through => :votes, :source => :proposal

  has_many :proposals

  MAX_VOTES = 3
  
  def admin?
    self.role == "admin" || self.email == "randquistcp@gmail.com"
  end

  def apply_omniauth(omniauth)
    
    self.email = omniauth['info']['email'] if email.blank?
    self.avatar_url = omniauth['info']['image'] if avatar_url.blank?
                                       
    authentications.build(:provider => omniauth['provider'],
                          :uid => omniauth['uid'])
  end

  def password_required?
    (authentications.empty? || !password.blank?) && super
  end

  def cast_vote proposal
    if proposals_voted_for.include?(proposal)
      success = false
      message = "You already voted for '#{proposal.title}', you may only vote once for each proposal."
    elsif votes_left <= 0
      success = false
      message = "You have used all #{MAX_VOTES} of your votes."
    else
      if votes.create(proposal_id: proposal.id)
        success = true
        message = "Your vote was successfully cast for '#{proposal.title}', you have #{pluralize(votes_left,"vote")} remaining."
      else
        success = false
        message = "We were unable to save your vote, sorry."
      end
    end
    
    return success, message
  end

  def remove_vote proposal
    if proposals_voted_for.include?(proposal)
      if votes.find_by_proposal_id(proposal.id).destroy
        success = true
        message = "Your vote has been removed from '#{proposal.title}, you have #{pluralize(votes_left, "vote")} remaining."
      else
        success = false
        message = "We were unable to remove your vote, sorry."
      end
    else
      success = false
      message = "You can not remove a vote from '#{proposal.title}' because you had not cast a vote for it."
    end
    return success, message
  end
  
  def votes_left
    MAX_VOTES - votes.count
  end
end
