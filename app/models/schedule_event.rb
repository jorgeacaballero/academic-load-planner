class ScheduleEvent < ActiveRecord::Base
  belongs_to :teacher
  belongs_to :course
  has_and_belongs_to_many :students
end
