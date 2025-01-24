class TrainingsController < ApplicationController
  
  private

    def base_params
      params.require(:training).permit(:trainer_id, :client_id, :training_date, :training_time, :duration_minutes, :training_type, :status)
    end
end
