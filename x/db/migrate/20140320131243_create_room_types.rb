class CreateRoomTypes < ActiveRecord::Migration
  def change
    create_table :room_types do |t|
      t.string :name
      t.string :capacity
      t.string :descrip
      t.string :url

      t.timestamps
    end
  end
end
