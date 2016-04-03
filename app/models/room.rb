class Room < ActiveRecord::Base
    has_many :schedule_events
end
