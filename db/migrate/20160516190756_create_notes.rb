class CreateNotes < ActiveRecord::Migration
  def change
    create_table :notes do |t|
      t.string :title
      t.string :content
      t.references :job, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end