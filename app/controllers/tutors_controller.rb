class TutorsController < ApplicationController

	def tutors
		@users = User.find_all_by_usertype('Tutor')
	end

	def tutees
		@users = User.find_all_by_usertype('Tutee')
	end

	def classes
		@users = User.find_all_by_usertype('Tutor')
	end
end
