class AddFbUidToUserData < ActiveRecord::Migration
  def change
    add_column :user_data, :fb_uid, :string
  end
end
