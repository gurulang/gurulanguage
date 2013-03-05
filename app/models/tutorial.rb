class Tutorial < ActiveRecord::Base
  attr_accessible :classID, :day, :end, :start, :status, :title, :tuteeID, :tutorID
end
