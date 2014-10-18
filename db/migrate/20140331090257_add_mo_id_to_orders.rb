class AddMoIdToOrders < ActiveRecord::Migration
  def change
    add_column :orders, :mo_id, :integer
  end
end
