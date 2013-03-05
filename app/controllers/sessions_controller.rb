class SessionsController < ApplicationController
  def new
  end

  def create
  	
		# usertype = params[usertype]
		# if(usertype == tutor)
		# @tutor = Tutor.authenticate(params[:username], params[:password])
	  user = User.authenticate(params[:username], params[:password])
	  if user
	    session[:user_id] = user.id
	    session[:usertype] = user.usertype

	    if user.username == "admin"
	    	redirect_to adminHome_path
	   	else 
	   		redirect_to prof_path, :notice => "Logged in!"
	   	end
	    
	  else
	     flash.now.alert = "Invalid username or password"
	     redirect_to users_path, :notice => "Invalid email or password!"
	  end
  end

	def destroy
	  session[:user_id] = nil
	  session[:usertype] = nil
	  redirect_to users_path, :notice => "Logged out!"
	end

	def login
	end
end
