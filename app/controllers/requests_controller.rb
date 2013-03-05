class RequestsController < ApplicationController


	def new
	  @request = Request.new
	end

	#def index
	#	@requests = Request.new
	#end

	# def create
	# @request = Request.new(params[:request])
	#   if @request.save
	#     redirect_to requestList_path, :notice => "Created Request!"
	#   else
	#     render "new"
	#   end
	# end

	def update
	end

	def create

		@request = Request.new(params[:request])
		@days = params[:day]
		id = 1000;
		day = 'Fack'
		@option = params[:dayOption]
		@matchTutor = Schedule.where("day IN (?)", params[:day])
		if @matchTutor.nil?
				@days.each do |noTutor|
					if (@days.first)
						@request.save
						@request.update_attributes(:tutorID=>id, :day=>day)
					else
						request = Request.new(params[:request])
						request.save
						request.update_attributes(:tutorID=>id, :day=>day)
					end

				
				end
				

		else
			@matchTutor.each do |tutor|
					if (@matchTutor.first)
						@request.save
						@request.update_attributes(:tutorID=>tutor.userID, :day=>day)
					else
						request = Request.new(params[:request])
						request.save
						request.update_attributes(:tutorID=>tutor.userID, :day=>day)
					end
				end

		end

		if @request.save

			redirect_to requestList_path, :notice=>"Created Request"
		end

		
		
	end

	def addRequest
		@request = Request.new

		#@temp = Request.new

   		#temp = Request.connection.select_values("select * from schedules where schedules.day = @request.day")

   		#temp = Request.connection.select_values("select userID from schedules where schedules.day = @request.day ")

   		#temp = Request.getTutors(@request.day)

   		
   		#temp do |element|
   		#	Request.connection.insert("INSERT INTO requests VALUES"+@request+tutorID) 
		#	#Request.create(params[:request], :tutorID=>temp[index])
		#en

		#redirect_to requestList_path
	end

	def addRequest2
		@request = Request.new
	end

	def requestList
		@requests = Request.all
	end

	# def getMaxID
	# 	#sql = 'select max(requestID) as max from requests'
 #  		#@max = Request.find_by_sql(sql)
 #  		@max = Request.last.id+ 1
	# end

	def approve

		@tutorial = Tutorial.new

		@tutorial.save

		request = Request.find(params[:id])
		
		@tutorial.update_attributes(:tuteeID => session[:user_id], :tutorID => request.tutorID, :day => request.day, :start => request.start, :end => request.end, :title => request.title, :status =>"Ongoing")
		
		Request.find(params[:id]).destroy

	end

	def apply
		# @temp = @tutorID
		# @flag = session[:user_id]
		# @message = @status
		# tempUser = Request.where(:tutorID=>@flag)
		# if tempUser.empty?
		# 	@flag = 0
		# else
		# 	@flag =1
		# end

		@request = Request.find(params[:id])
		if @request.update_attribute(:status,"Applied")
			redirect_to requestNotif_path
		end


		# @request = Request.find(params[:id])
		# message = @request.status
	end
	##################################################################################################

	def myRequestList			#for TUTEES
		tempID = session[:user_id]
		@myRequests= Request.where(:tuteeID => tempID) if tempID.present?
		@count = Request.where(:tuteeID => tempID).count
	end

end



# form
# 	requestID [hidden] => getMax(requestID) + 1
# 	day
# 	start
# 	end
# 	title
# 	status [hidden] = pending





# *requests
# requestID	integer
# tuteeID		integer
# tutorID		integer
# day		string
# start		time
# end		time
# title		string
# status		string

# *freeTime
# tutorID		integer
# day		string
# start		time
# end		time


# def delete
# 	Request.find(params[:requestID]).destroy
# 	Request.destroy
# end
