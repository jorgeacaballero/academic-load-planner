class CreateScheduleEvents < ActiveRecord::Migration
  def change
    create_table :schedule_events do |t|
      t.references :teacher, index: true, foreign_key: true
      t.references :course, index: true, foreign_key: true
      t.datetime :start_time
      t.datetime :end_rime

      t.timestamps null: false
    end
  end
end
