class Presenter < ActiveRecord::Base
  attr_accessible :proposal_id, :speaker_id

  belongs_to :proposal

  belongs_to :speaker
  
end
