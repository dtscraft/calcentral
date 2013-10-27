class CreateEvents < ActiveRecord::Migration
  def change
    create_table :events do |t|
      t.datetime :start_time
      t.datetime :end_time
      t.string :description
      t.string :name
      t.string :club

      t.timestamps
    end
  end
end
