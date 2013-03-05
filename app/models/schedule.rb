class Schedule < ActiveRecord::Base
  attr_accessible :day, :end, :start, :userID 
  belongs_to :users 
end
