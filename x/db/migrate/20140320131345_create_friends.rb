class CreateFriends < ActiveRecord::Migration
  def change
    create_table :friends do |t|
      t.references :user, index: true
      t.references :user, index: true
      t.integer :seq

      t.timestamps
    end
  end
end
