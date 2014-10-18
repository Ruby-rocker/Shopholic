class CreateAuctions < ActiveRecord::Migration
  def change
    create_table :auctions do |t|
      t.integer :user_id
      t.string :name
      t.string :title
      t.text :description
      t.integer :reserved_price

      t.timestamps
    end
  end
end
