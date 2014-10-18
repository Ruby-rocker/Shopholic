class AddAttachmentAvatarToAuctions < ActiveRecord::Migration
  def self.up
    change_table :auctions do |t|
      t.attachment :avatar
    end
  end

  def self.down
    drop_attached_file :auctions, :avatar
  end
end
