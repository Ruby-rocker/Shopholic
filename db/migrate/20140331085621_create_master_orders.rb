class CreateMasterOrders < ActiveRecord::Migration
  def change
    create_table :master_orders do |t|
      t.integer :user_id
      t.integer :total_amt
      t.string :status

      t.timestamps
    end
  end
end
