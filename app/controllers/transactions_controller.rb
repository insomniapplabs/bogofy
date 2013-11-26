class TransactionsController < ApplicationController

	before_filter :set_archive_list

	def create
		@transaction = current_user.transactions.build(transaction_params)
		if @transaction.save
			redirect_to transactions_path
		end
	end

	def index
		@transaction = current_user.transactions.build
		@transactions_this_month = current_user.transactions.where('date >= ? AND date <= ?', Time.now.beginning_of_month, Time.now.end_of_month).order('date desc')
		@transactions = current_user.transactions.order('date desc')
		@link = current_user.links.build
  	@links = current_user.links.order('link_name asc')
  	@list = current_user.lists.build
  	@lists = current_user.lists.order('name asc')
  	@micropost = current_user.microposts.build
  	@microposts = current_user.microposts.order('created_at desc')
    @new_users = User.order('created_at desc')
    @store = current_user.stores.build
	end

	def destroy
	end

	def archive
		#@transaction = current_user.transactions.build
		#@transactions_this_month = current_user.transactions.where('date >= ? AND date <= ?', Time.now.beginning_of_month, Time.now.end_of_month)
		@transactions = current_user.transactions.order('date desc')
		@link = current_user.links.build
  	@links = current_user.links.order('link_name asc')
  	@list = current_user.lists.build
  	@lists = current_user.lists.order('name asc')
  	#@micropost = current_user.microposts.build4
  	#@microposts = current_user.microposts.order('created_at desc')
    #@new_users = User.order('created_at desc')
    #@store = current_user.stores.build
		start_time = Time.mktime(params[:year] || 2007, params[:month] || 1, params[:day] || 1)
		end_time = start_time.next_month
		@transactions = Transaction.where('date BETWEEN ? AND ?', start_time, end_time).order('created_at desc')
		
	end

	def set_archive_list
		transactions = Transaction.where('date < ?', Time.now.beginning_of_month).order('created_at desc')
		@archive_list = transactions.collect do |t|
			[t.date.strftime('%B %Y'), t.date.year, t.date.month]
		end
		@archive_list.uniq!
	end

	private

		def transaction_params
			params.require(:transaction).permit(:date, :saved, :spent, :store_id)
		end

end
