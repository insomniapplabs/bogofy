class UsersController < ApplicationController

	def show
		@user = User.find(params[:id])
		@microposts = current_user.microposts.order('created_at desc')
	end

	def follow
		@user = User.find(params[:id])
		current_user.follow(@user)
		respond_to do |format|
			format.js { render action: "follow" }
		end
	end

	def unfollow
		@user = User.find(params[:id])
		current_user.stop_following(@user)
		respond_to do |format|
			format.js { render action: "unfollow" }
		end
	end


end
