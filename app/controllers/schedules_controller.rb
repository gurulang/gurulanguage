class SchedulesController < ApplicationController

	def create
	 @day = params[:day]
	 @message = @day.first




	  unless params[:day].nil?
	  	params[:day].each do |day|
		  	 @schedule = Schedule.new(params[:schedule])
			 tempDay = day
			 @schedule.save
			 @schedule.update_attributes(:day=>tempDay)

				  @nash = day
				  currentTutor = session[:user_id]
				  # @temps = Request.select(:requestID).uniq.where(:day => tempDay)
				  @temps = Request.where(:day=>tempDay).group(:requestID)
				  @check = Schedule.where(:day=>tempDay, :userID=>currentTutor).group(:userID)
				  # selects distinct request where day=tutor's input day

				  # unless @check.exists?
				  	@temps.each do|temp|
					  	tempTutor = session[:user_id]
					  	request = Request.new(params[:temp])
					  	# request.tutorID = session[:user_id]
					  	request.save
						request.update_attributes(:requestID=>temp.requestID,
												 :tuteeID=>temp.tuteeID,
												 :tutorID=>tempTutor,
												 :day=>temp.day,
												 :startDate=>temp.startDate,
												 :endDate=>temp.endDate,
												 :startTime=>temp.startTime,
												 :endTime=>temp.endTime,
												 :title=>temp.title,
												 :status=>temp.status)
					end
				
				# end  

			 @schedule.save
			 end


	  end  

		  if @schedule.save
		    redirect_to schedules_path, :notice => "Created Schedule!"
		  else
		    render "new"
		  end
	end 



	def index
		@schedules = Schedule.all
	end

	def new
	  @schedule = Schedule.new
	end

	#def index
	#	@schedules = Schedule.new
	#end

	def addSched
		@schedule = Schedule.new
	end

	def schedulesList
		@schedules = Schedule.all
	end

	def delete
		Schedule.find(params[:id]).destroy
		Schedule.destroy
	end
	

	def myScheduleList			#for TUTORS
		tempID = session[:user_id]
		@mySchedules= Schedule.where(:userID => tempID) if tempID.present?
		@count = Schedule.where(:userID => tempID).count
	end
end