class ClientsController < BaseController
  
  private

  def base_params
    params.require(:client).permit(:name, :email, :phone, :membership_type, :membership_start_date, :membership_end_date)
  end
end
