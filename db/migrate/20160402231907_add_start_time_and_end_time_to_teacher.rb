class AddStartTimeAndEndTimeToTeacher < ActiveRecord::Migration
  def change
    add_column :teachers, :start_time, :datetime
    add_column :teachers, :end_time, :datetime
  end
end
