class PhotosController < ApplicationController

	def create
		@photo = current_user.photos.build(photo_params)
		if @photo.save
			redirect_to user
		end
	end

	def destroy

	end

	private

		def photo_params
			params.require(:photo).permit(:image, :user_id)
		end

end
