class TrainersController < ApplicationController

  private

  def base_params
    params.require(:trainer).permit(:last_name, :first_name, :middle_name, :specialization, :email, :phone)
  end
end
