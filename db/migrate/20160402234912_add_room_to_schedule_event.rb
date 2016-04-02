class AddRoomToScheduleEvent < ActiveRecord::Migration
  def change
    add_reference :schedule_events, :room, index: true, foreign_key: true
  end
end
