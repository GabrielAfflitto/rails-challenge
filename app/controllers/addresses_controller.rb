class AddressesController < ApplicationController
  def create
    @address = Address.new(address_params)
    @address.student_id = params[:student_id]

    @address.save

    redirect_to student_path(@address.student)
  end

  private

  def address_params
    params.require(:address).permit(:description, :street_address, :city, :state, :zipcode, :student_id)
  end
end
