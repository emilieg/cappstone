class CreateContacts < ActiveRecord::Migration
  def change
    create_table :contacts do |t|
      t.string :name
      t.string :title
      t.string :phone
      t.string :email
      t.string :linkedin
      t.references :company, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
