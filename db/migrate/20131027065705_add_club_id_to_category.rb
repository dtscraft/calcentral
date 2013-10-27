class AddClubIdToCategory < ActiveRecord::Migration
  def change
    add_column :categories, :club_id, :integer
  end
end
