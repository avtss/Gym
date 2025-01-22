class WorkSchedulesController < BaseController

  private

  def base_params
    params.require(:work_schedule).permit(:trainer_id, :day_of_week, :start_time, :end_time)
  end
end
