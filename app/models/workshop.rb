class Workshop < ActiveRecord::Base
  attr_accessible :abstract, :name, :presented_at

  has_many :instructors, :dependent => :destroy

  has_many :speakers, :through => :instructors
  
  scope :day, proc { |day| where("day(presented_at) = '#{day.split("-")[2]}' and month(presented_at) = '#{day.split("-")[1]}' and year(presented_at) = '#{day.split("-")[0]}'") }

end
