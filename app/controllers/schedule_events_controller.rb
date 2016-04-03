class ScheduleEventsController < ApplicationController
  include ScheduleEventsHelper
  before_action :set_schedule_event, only: [:show, :edit, :update, :destroy]

  # GET /schedule_events
  # GET /schedule_events.json
  def index
    @schedule_events_7 = ScheduleEvent.where(time_order: 7)
    @schedule_events_8 = ScheduleEvent.where(time_order: 8)
    @schedule_events_10 = ScheduleEvent.where(time_order: 10)
    @schedule_events_11 = ScheduleEvent.where(time_order: 11)
    @schedule_events_13 = ScheduleEvent.where(time_order: 13)
    @schedule_events_14 = ScheduleEvent.where(time_order: 14)
    @schedule_events_15 = ScheduleEvent.where(time_order: 15)
    @schedule_events_17 = ScheduleEvent.where(time_order: 17)
    @schedule_events_18 = ScheduleEvent.where(time_order: 18)
    @schedule_events = ScheduleEvent.all
    @students = Student.all
  end

  # GET /create_new_schedule
  def create_new_schedule
    # Delete current schedule
    ScheduleEvent.delete_all()
    # Order courses by ammount of students that need to take course
    courses = Course.joins(:students).group("courses_students.course_id").order("COUNT(*) DESC") 
    # From the top of the list start filling schedule based on teacher availability
    courses.each do |c|
      if c.students.count == 0 or c.teachers.count == 0
      # check if there is no students at that course, continue
      
      elsif c.students.count > 40 and c.teachers.count > 1
      # lets check if there are more than one teacher and more than 40 students
        # we can make two or more sections for this course
        c.teachers.each do |t|
          # check availability of each teacher and create sections based on availability
        end
      # we just need one section for this course
      else
        schedule_event(c)
      end
    end
    #   Don't schedule more than the # of available rooms and 40 students per room
    # Save everything
    # Send data
    respond_to do |format|
      format.html { redirect_to schedule_events_url, notice: 'Schedule was successfully created.' }
    end
    # Profit
  end

  # GET /schedule_events/1
  # GET /schedule_events/1.json
  def show
  end

  # GET /schedule_events/new
  def new
    @schedule_event = ScheduleEvent.new
  end

  # GET /schedule_events/1/edit
  def edit
  end

  # POST /schedule_events
  # POST /schedule_events.json
  def create
    @schedule_event = ScheduleEvent.new(schedule_event_params)

    respond_to do |format|
      if @schedule_event.save
        format.html { redirect_to @schedule_event, notice: 'Schedule event was successfully created.' }
        format.json { render :show, status: :created, location: @schedule_event }
      else
        format.html { render :new }
        format.json { render json: @schedule_event.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /schedule_events/1
  # PATCH/PUT /schedule_events/1.json
  def update
    respond_to do |format|
      if @schedule_event.update(schedule_event_params)
        format.html { redirect_to @schedule_event, notice: 'Schedule event was successfully updated.' }
        format.json { render :show, status: :ok, location: @schedule_event }
      else
        format.html { render :edit }
        format.json { render json: @schedule_event.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /schedule_events/1
  # DELETE /schedule_events/1.json
  def destroy
    @schedule_event.destroy
    respond_to do |format|
      format.html { redirect_to schedule_events_url, notice: 'Schedule event was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_schedule_event
      @schedule_event = ScheduleEvent.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def schedule_event_params
      params.require(:schedule_event).permit(:teacher_id, :course_id, :start_time, :end_rime)
    end
end
