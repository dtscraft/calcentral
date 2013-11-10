class AddFbOauthTokenToUserData < ActiveRecord::Migration
  def change
    add_column :user_data, :fb_user, :string
    add_column :user_data, :fb_provider, :string
    add_column :user_data, :fb_name, :string
    add_column :user_data, :fb_oauth_token, :string
    add_column :user_data, :fb_oauth_expires_at, :datetime
  end
end
