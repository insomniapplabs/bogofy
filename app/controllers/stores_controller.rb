class StoresController < ApplicationController

	def create
		@store = current_user.stores.build(store_params)
		if @store.save
			redirect_to transactions_path
		end
	end

	private

		def store_params
			params.require(:store).permit(:name, :user_id)
		end

end
