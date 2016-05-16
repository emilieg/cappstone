class CreateJobs < ActiveRecord::Migration
  def change
    create_table :jobs do |t|
      t.string :position
      t.string :department
      t.string :address
      t.string :apply_date
      t.string :job_description_url
      t.boolean :relocation
      t.decimal :comp_value, precision: 10, scale: 2
      t.string :comp_type
      t.references :user, index: true, foreign_key: true
      t.references :company, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
