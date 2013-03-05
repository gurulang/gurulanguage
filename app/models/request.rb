class Request < ActiveRecord::Base
  attr_accessible :day, :end, :requestID, :start, :status, :title, :tuteeID, :tutorID,:startDate, :endDate, :startTime, :endTime
  belongs_to :users 

  def getMaxID

    temp = Request.connection.select_values("select max(requestID) as max from requests")

    if(temp[0] == nil)
      max = 0
    else
      max = temp[0]
    end

    max = max + 1
		# sql = "select max(requestID) as max from requests"
  # 	temp = Request.find_by_sql(sql)

  #   for element in temp do
  #     max = element
  #   end
  # 		@max = @max[:max]
  		
  # 		#@max = @max + 1;

    # temp = Request.last.requestID + 1

    #   if(:requestID == nil)
    #     @max = Request.last.requestID + 1
    #   else 
  		#   @max = Request.last.requestID + 1
  		# end
  end

  def getTutors
     Request.connection.select_values("select userID from schedules where schedules.day='Monday'")
   end



 #  insert into requests values requestID, session[user_id], 
 # (select tutorID from schedule where schedule.day==request.day), day, start, end, title, status
end
