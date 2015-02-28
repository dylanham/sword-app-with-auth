class CreateSwords < ActiveRecord::Migration
  def change
    create_table :swords do |t|
      t.string :name
      t.string :style
      t.string :user_id

      t.timestamps null: false
    end
  end
end
