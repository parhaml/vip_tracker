class CreateStudents < ActiveRecord::Migration[5.1]
  def change
    create_table :students do |t|
      t.string :name
      t.integer :age
      t.date :birthday
      t.string :picture

      t.timestamps
    end
  end
end