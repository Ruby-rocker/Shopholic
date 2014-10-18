class AddUserIdToBiddings < ActiveRecord::Migration
  def change
    add_column :biddings, :user_id, :integer
  end
end
