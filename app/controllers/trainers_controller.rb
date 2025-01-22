class TrainersController < BaseController

  private

  def base_params
    params.require(:trainer).permit(:name, :specialization, :email, :phone, :availability_schedule)
  end
end
