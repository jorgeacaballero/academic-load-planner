class CreateScheduleEventStudent < ActiveRecord::Migration
  def change
    create_table :schedule_events_students, id: false do |t|
        t.belongs_to :schedule_event, index: true
        t.belongs_to :student, index: true
    end
  end
end
