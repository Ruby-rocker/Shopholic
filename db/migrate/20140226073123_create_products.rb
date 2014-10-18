class CreateProducts < ActiveRecord::Migration
  def change
    create_table :products do |t|
      t.integer :category_id
      t.integer :brand_id
      t.string :name
      t.string :description
      t.decimal :price, :precision => 8, :scale => 2

      t.timestamps
    end
  end
end
