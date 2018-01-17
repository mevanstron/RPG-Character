class CreateCharacters < ActiveRecord::Migration[5.1]
  def change
    create_table :characters do |t|
      t.string :name
      t.string :race
      t.string :class
      t.integer :user_id
    end
  end
end
