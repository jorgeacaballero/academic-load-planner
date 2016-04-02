class CreateCourseTeacher < ActiveRecord::Migration
  def change
    create_table :courses_teachers, id: false do |t|
        t.belongs_to :teacher, index: true
        t.belongs_to :course, index: true
    end
  end
end
