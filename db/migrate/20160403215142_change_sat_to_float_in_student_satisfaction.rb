class ChangeSatToFloatInStudentSatisfaction < ActiveRecord::Migration
  def change
    change_column :student_satisfactions, :sat, :float
  end
end
