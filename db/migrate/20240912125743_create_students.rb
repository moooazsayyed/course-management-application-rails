class CreateStudents < ActiveRecord::Migration[7.1]
  def change
    create_table :students do |t|
      t.string :name
      t.string :course
      t.string :dept
      t.string :div
      t.integer :year
      t.string :email

      t.timestamps
    end
  end
end
