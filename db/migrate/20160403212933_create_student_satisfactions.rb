class CreateStudentSatisfactions < ActiveRecord::Migration
  def change
    create_table :student_satisfactions do |t|
      t.references :student, index: true, foreign_key: true
      t.decimal :sat

      t.timestamps null: false
    end
  end
end
