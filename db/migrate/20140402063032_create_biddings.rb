class CreateBiddings < ActiveRecord::Migration
  def change
    create_table :biddings do |t|
      t.string :bidder
      t.integer :bid_price
      t.references :auction

      t.timestamps
    end
    add_index :biddings, :auction_id
  end
end
