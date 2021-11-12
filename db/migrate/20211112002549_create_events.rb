class CreateEvents < ActiveRecord::Migration[6.1]
  def change
    create_table :events do |t|
      t.string :name
      t.string :event_date
      t.string :type_event
      t.string :description
      t.boolean :cancel,:default => false
      t.references :palace, null: false, foreign_key: true

      t.timestamps
    end
  end
end
