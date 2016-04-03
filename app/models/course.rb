class Course < ActiveRecord::Base
    has_and_belongs_to_many :teachers
    has_and_belongs_to_many :students
    has_many :schedule_events
end
