class Instructor < ActiveRecord::Base
  attr_accessible :speaker_id, :workshop_id

  belongs_to :speaker

  belongs_to :workshop
end
