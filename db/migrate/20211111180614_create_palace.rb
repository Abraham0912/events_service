class CreatePalace < ActiveRecord::Migration[6.1]
  def change
    create_table :palaces do |t|
      t.string :name
      t.string :capacity
      t.string :location

      t.timestamps
    end
  end
end
