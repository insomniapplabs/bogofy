class CreateTransactions < ActiveRecord::Migration
  def change
    create_table :transactions do |t|
      t.date :date
      t.decimal :spent, precision: 8, scale: 2
      t.decimal :saved, precision: 8, scale: 2
      t.integer :user_id

      t.timestamps
    end
  end
end
