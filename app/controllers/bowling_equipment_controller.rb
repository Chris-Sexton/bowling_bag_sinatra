class BowlingEquipmentsController < ApplicationController 
  get "/equipment" do
    redirect_if_not_logged_in 
    @equipment = BowlingEquipment.all
    erb :'bowling_equipment/index'
  end

  get "/equipment/new" do
    redirect_if_not_logged_in 
    @error_message = params[:error]
    erb :'bowling_equipment/new'
  end

  get "/equipment/:id/edit" do
    redirect_if_not_logged_in 
    @error_message = params[:error]
    @club = BowlingEquipment.find(params[:id])
    erb :'bowling_equipment/edit'
  end

end