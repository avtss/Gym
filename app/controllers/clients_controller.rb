class ClientsController < ApplicationController
  
  private

  def base_params
    params.require(:client).permit(:last_name, :first_name, :middle_name, :email, :phone, :membership_type, :membership_start_date, :membership_end_date)
  end
end
