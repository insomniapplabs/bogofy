class MicropostsController < ApplicationController

	def create
		@micropost = current_user.microposts.build(micropost_params)
		if @micropost.save
			redirect_to root_path
		end
	end

	def destroy

	end

	private

		def micropost_params
			params.require(:micropost).permit(:content, :user_id)
		end
end
