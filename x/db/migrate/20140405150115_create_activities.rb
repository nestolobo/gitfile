class CreateActivities < ActiveRecord::Migration
  def change
    create_table :activities do |t|
      t.string :name
      t.integer :day
      t.integer :start_time
      t.integer :end_time
      t.references :location, index: true

      t.timestamps
    end
  end
end
