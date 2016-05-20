class CreateEvents < ActiveRecord::Migration
  def change
    create_table :events do |t|
      t.string :title
      t.string :description
      t.string :address
      t.string :event_timestamp
      t.references :event_type, index: true, foreign_key: true
      t.references :job, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
