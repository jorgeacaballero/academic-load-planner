module ScheduleEventsHelper
    def room_availabile?(room, time_order)
        v = room.schedule_events.where(time_order: time_order)
        return v.blank?
    end

    def schedule_event(c)
        Room.all.each do |r|
          [7,8,10,11,13,14,15,17,18].each do |time|
            if room_availabile?(r, time) && time >= c.teachers.first.start_time && time < c.teachers.first.end_time
              ScheduleEvent.create!(teacher: c.teachers.first, course: c, room: r, time_order: time)
              return true
            end
          end
        end
    end

    def get_next_available_time(teacher, time)
        if teacher.start_time >= time and teacher.end_time < time
            times = [7,8,10,11,13,14,15,17,18]
            index_of_current = times.index(time)
            if index_of_current != 18
                return times[index_of_current+1]
            end
        end
        return nil
    end

    def get_students_satisfaction()
        Student.each do |s|
    
        end
    end
end
