class CreateResumes < ActiveRecord::Migration
  def change
    create_table :resumes do |t|
      t.integer :job_id
      t.integer :user_id
      t.string :name
      t.string :attachment

      t.timestamps null: false
    end
  end
end
