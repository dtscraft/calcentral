class AddFacebookIdToClubs < ActiveRecord::Migration
  def change
    add_column :clubs, :facebook_id, :string
  end
end
