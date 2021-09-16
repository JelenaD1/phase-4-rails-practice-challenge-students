class CreateStudents < ActiveRecord::Migration[6.1]
  def change
    create_table :students do |t|
      t.string :name, null: false
      t.string :major
      t.integer :age, null: false
      t.integer :instructor_id, null: false

      t.timestamps
    end
  end
end
