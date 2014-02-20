class MotionEventsController < ApplicationController
  before_action :set_motion_event, only: [:show, :edit, :update, :destroy]

  # GET /motion_events
  # GET /motion_events.json
  def index
    @motion_events = MotionEvent.all
  end

  # GET /motion_events/1
  # GET /motion_events/1.json
  def show
  end

  # GET /motion_events/new
  def new
    @motion_event = MotionEvent.new
  end

  # GET /motion_events/1/edit
  def edit
  end

  # POST /motion_events
  # POST /motion_events.json
  def create
    @motion_event = MotionEvent.new(motion_event_params)

    respond_to do |format|
      if @motion_event.save
        format.html { redirect_to @motion_event, notice: 'Motion event was successfully created.' }
        format.json { render action: 'show', status: :created, location: @motion_event }
      else
        format.html { render action: 'new' }
        format.json { render json: @motion_event.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /motion_events/1
  # PATCH/PUT /motion_events/1.json
  def update
    respond_to do |format|
      if @motion_event.update(motion_event_params)
        format.html { redirect_to @motion_event, notice: 'Motion event was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @motion_event.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /motion_events/1
  # DELETE /motion_events/1.json
  def destroy
    @motion_event.destroy
    respond_to do |format|
      format.html { redirect_to motion_events_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_motion_event
      @motion_event = MotionEvent.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def motion_event_params
      params.require(:motion_event).permit(:seq_id, :time_stamp, :sleep, :activity_class, :action_type, :param, :view, :report_id)
    end
end
