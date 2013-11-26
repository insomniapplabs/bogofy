	class ListsController < ApplicationController

	before_filter :authenticate_user!

	def create
		@list = current_user.lists.build(list_params)
		if @list.save
			redirect_to root_path
		end
	end

	def show
		@list = current_user.lists.find(params[:id])
		@links = current_user.links.order('link_name asc')
		@transaction = current_user.transactions.build
		#@transactions_this_month = current_user.transactions.where('date >= ? AND date <= ?', Time.now.beginning_of_month, Time.now.end_of_month).order('date desc')
		@transactions = current_user.transactions.order('date desc')
		@link = current_user.links.build
  	@links = current_user.links.order('link_name asc')
  	@shopping_list = current_user.lists.build
  	@shopping_lists = current_user.lists.order('name asc')
  	#@micropost = current_user.microposts.build
  	#@microposts = current_user.microposts.order('created_at desc')
    #@new_users = User.order('created_at desc')
    #@store = current_user.stores.build
	end

	def destroy
	end

	private

		def list_params
			params.require(:list).permit(:name, :user_id)
		end
		
end
