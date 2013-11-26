class ItemsController < ApplicationController

	def create
		@list = current_user.lists.find(params[:list_id])
		@item = @list.items.create!(item_params)

		respond_to do |format|
			format.html { redirect_to list_path(@list) }
			format.js
		end
	end

	def destroy

	end

	private

		def item_params
			params.require(:item).permit(:name,:list_id,:complete)
		end

end
