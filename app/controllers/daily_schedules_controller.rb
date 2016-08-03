class DailySchedulesController < ApplicationController
  before_action :set_daily_schedule, only: [:show, :edit, :update, :destroy]

  # GET /daily_schedules
  # GET /daily_schedules.json
  def index
    @daily_schedules = DailySchedule.all
  end

  # GET /daily_schedules/1
  # GET /daily_schedules/1.json
  def show
  end

  # GET /daily_schedules/new
  def new
    @daily_schedule = DailySchedule.new
  end

  # GET /daily_schedules/1/edit
  def edit
  end

  # POST /daily_schedules
  # POST /daily_schedules.json
  def create
    @daily_schedule = DailySchedule.new(daily_schedule_params)

    respond_to do |format|
      if @daily_schedule.save
        format.html { redirect_to @daily_schedule, notice: 'Daily schedule was successfully created.' }
        format.json { render :show, status: :created, location: @daily_schedule }
      else
        format.html { render :new }
        format.json { render json: @daily_schedule.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /daily_schedules/1
  # PATCH/PUT /daily_schedules/1.json
  def update
    respond_to do |format|
      if @daily_schedule.update(daily_schedule_params)
        format.html { redirect_to @daily_schedule, notice: 'Daily schedule was successfully updated.' }
        format.json { render :show, status: :ok, location: @daily_schedule }
      else
        format.html { render :edit }
        format.json { render json: @daily_schedule.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /daily_schedules/1
  # DELETE /daily_schedules/1.json
  def destroy
    @daily_schedule.destroy
    respond_to do |format|
      format.html { redirect_to daily_schedules_url, notice: 'Daily schedule was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_daily_schedule
      @daily_schedule = DailySchedule.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def daily_schedule_params
      params.require(:daily_schedule).permit(:delivery_date)
    end
end
