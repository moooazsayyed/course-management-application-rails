class CreateTeachers < ActiveRecord::Migration[7.1]
  def change
    create_table :teachers do |t|
      t.string :name
      t.string :course
      t.string :dept
      t.string :email

      t.timestamps
    end
  end
end
