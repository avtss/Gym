class WorkSchedulesController < ApplicationController
  before_action :set_work_schedule, only: %i[show edit update destroy]

  # GET /work_schedules or /work_schedules.json
  def index
    @work_schedules = WorkSchedule.includes(:trainer).all
  end

  # GET /work_schedules/1 or /work_schedules/1.json
  def show
  end

  # GET /work_schedules/new
  def new
    @work_schedule = WorkSchedule.new
  end

  # GET /work_schedules/1/edit
  def edit
  end

  # POST /work_schedules or /work_schedules.json
  def create
    @work_schedule = WorkSchedule.new(work_schedule_params)

    respond_to do |format|
      if @work_schedule.save
        format.html { redirect_to work_schedules_path, notice: "Work schedule was successfully created." }
        format.json { render :index, status: :created, location: work_schedules_path }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @work_schedule.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /work_schedules/1 or /work_schedules/1.json
  def update
    respond_to do |format|
      if @work_schedule.update(work_schedule_params)
        format.html { redirect_to work_schedules_path, notice: "Work schedule was successfully updated." }
        format.json { render :index, status: :ok, location: work_schedules_path }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @work_schedule.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /work_schedules/1 or /work_schedules/1.json
  def destroy
    @work_schedule.destroy
    redirect_to work_schedules_path, notice: 'Рабочее расписание успешно удалено.'
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_work_schedule
    @work_schedule = WorkSchedule.find(params[:id])
  end

  # Only allow a list of trusted parameters through.
  def work_schedule_params
    params.require(:work_schedule).permit(:trainer_id, :day_of_week, :start_time, :end_time)
  end
end
