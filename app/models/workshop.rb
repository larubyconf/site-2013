class Workshop < ActiveRecord::Base
  attr_accessible :abstract, :name, :presented_at

  scope :day, proc { |day| where("day(presented_at) = '#{day.split("-")[2]}' and month(presented_at) = '#{day.split("-")[1]}' and year(presented_at) = '#{day.split("-")[0]}'") }

end
