class Student < ActiveRecord::Base
    has_and_belongs_to_many :schedule_events
    has_and_belongs_to_many :courses
    has_one :student_satisfaction
end
