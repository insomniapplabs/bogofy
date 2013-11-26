class AddStoreIdToTransaction < ActiveRecord::Migration
  def change
    add_column :transactions, :store_id, :integer
  end
end
