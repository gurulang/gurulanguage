class UsersController < ApplicationController
	def new
	  @user = User.new
	end

	def create
		# usertype = params[usertype]
		# if(usertype == tutor)
		# @tutor = Tutor.new(params[:user])
	  @user = User.new(params[:user])
	  if @user.save
	  	session[:user_id] = @user.id
	    redirect_to prof_path, :notice => "Signed up!"
	  else
	    render "new"
	  end
	end

	def index
		@user = User.new
	end

	def signup
		@user = User.new
	end

	def profile
	end

	def applicantsList			#for TUTEES
		tempID = session[:user_id]
		@myRequests= Request.where(:tuteeID => tempID , :status => "Applied") if tempID.present?
		@count = Request.where(:tuteeID => tempID , :status => "Applied").count
	end


	def myRequestList			#for TUTEES
		tempID = session[:user_id]
		@myRequests= Request.where(:tuteeID => tempID) if tempID.present?
		@count = Request.where(:tuteeID => tempID).count
	end

	def requestNotif			#for TUTORS
		tempID = session[:user_id]
		@myRequests= Request.where(:tutorID => tempID) if tempID.present?
		@count = Request.where(:tutorID => tempID).count
	end

	def myScheduleList			#for TUTORS
		tempID = session[:user_id]
		@mySchedules= Schedule.where(:userID => tempID) if tempID.present?
		@count = Schedule.where(:userID => tempID).count
	end
	
	def prof
		tempID = session[:user_id]
		# if(@tempID == 23)
		# 	@tempID = 1
		# else
		# 	@tempID = 0
		# end
		# sql = "select distinct requestID, tutorID, title, tuteeID from requests where requests.tutorID = @tempID"


		# @temps = Request.find_by_sql(sql);
		# if(@temps.empty?)
		# 	@tempID = 0
		# else
		# 	@tempID = 1
		# end
		# @temps = Request.all
		@temps= Request.where(:tutorID => tempID) if tempID.present?
		@count = Request.where(:tutorID => tempID).count
		# @count = Request.count(@temps)
		 # @temps = Request.where("tutorID=?", params[:tutorID])
  




	end

	def tutorList
		@users = User.find_all_by_usertype('Tutor')
	end

	def tuteeList
		# @user = User.all
		@users = User.find_all_by_usertype('Tutee')
	end


	# def profile
	# 	# @id = session[:user_id]
	# 	@user = User.find(params[session[:user_id]])
	# 	@people
	# 	if(@user.usertype == "Tutor")
	# 		@people = User.find_all_by_usertype('Tutee')
	# 	else
	# 		@people = User.find_all_by_usertype('Tutor')
	# 	end

	# end

	def destroy
	 @user = User.find(params[:id])

	 if(@user.usertype == 'Tutor')
	 	temp = 1
	 else
	 	temp = 2
	 end

		 @user.destroy

		 if(temp==1)
		 	redirect_to tutorsList_path
		 else
		 	redirect_to tuteesList_path
		 end
	end

	def notify
		 @user = User.find(params[:id])
	 	@tempID = @user.id
		sql = "select distinct requestID, tuteeID, tutorID, title from schedules where requests.tutorID = @tempID"
		@temp = Request.find_by_sql(sql);

	

		redirect_to requestList_path, :notice => "true"


	end



	# def tutors
	# 	@users = User.find_all_by_usertype('Tutor')
	# end

	# def tutees
	# 	@users = User.find_all_by_usertype('Tutee')
	# end

	
end
