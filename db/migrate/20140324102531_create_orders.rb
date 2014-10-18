class CreateOrders < ActiveRecord::Migration
  def change
    create_table :orders do |t|
      t.integer :user_id
      t.integer :product_id
      t.decimal :price
      t.integer :quantity
      t.string :status
      t.text :baddress
      t.integer :zipcode
      t.string :city
      t.string :state
      t.decimal :total_amount

      t.timestamps
    end
  end
end
