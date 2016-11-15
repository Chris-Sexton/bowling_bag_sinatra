class GolfBagsController < ApplicationController 

  get "/bags" do
    redirect_if_not_logged_in
    @bags = BowlingBag.all
    erb :'bowling_bags/index'
  end

  get "/bags/new" do
    redirect_if_not_logged_in
    @error_message = params[:error]
    erb :'bowling_bags/new'
  end

  get "/bags/:id/edit" do
    redirect_if_not_logged_in
    @error_message = params[:error]
    @bag = BowlingBag.find(params[:id])
    erb :'bowling_bags/edit'
  end

end