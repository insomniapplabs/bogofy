class LinksController < ApplicationController

	def create
		@link = current_user.links.build(link_params)
		if @link.save
			redirect_to root_path
		end
	end

	def destroy

	end

	private

		def link_params
			params.require(:link).permit(:link_name, :link_url, :user_id)
		end
end
