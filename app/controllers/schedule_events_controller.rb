class ScheduleEventsController < ApplicationController
  before_action :set_schedule_event, only: [:show, :edit, :update, :destroy]

  # GET /schedule_events
  # GET /schedule_events.json
  def index
    @schedule_events = ScheduleEvent.all
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
