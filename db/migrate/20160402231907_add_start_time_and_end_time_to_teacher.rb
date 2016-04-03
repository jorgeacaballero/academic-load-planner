class AddStartTimeAndEndTimeToTeacher < ActiveRecord::Migration
  def change
    add_column :teachers, :start_time, :integer
    add_column :teachers, :end_time, :integer
  end
end
