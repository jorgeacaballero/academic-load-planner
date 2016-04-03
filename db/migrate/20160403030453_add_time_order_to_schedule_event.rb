class AddTimeOrderToScheduleEvent < ActiveRecord::Migration
  def change
    add_column :schedule_events, :time_order, :integer
  end
end
