class BowlingBagsController < ApplicationController 

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

  post "/bags/:id" do
    redirect_if_not_logged_in
    @bag = BowlingBag.find(params[:id])
    unless BowlingBag.valid_params?(params)
      redirect "/bags/#{@bag.id}/edit?error=invalid bowling bag"
    end
    @bag.update(params.select{|b| b =="name" || b =="capacity"})
    redirect "/bags/#{@bag.id}"
  end

  get "/bags/:id" do
    redirect_if_not_logged_in
    @bag = BowlingBag.find(params[:id])
    erb :'bowling_bags/show'
  end

  get '/bags/:id/delete' do
    @bag = BowlingBag.find_by_id(params[:id])
    @bag.destroy
    erb :'bowling_bags/delete'
  end

  post "/bags" do
    redirect_if_not_logged_in

    unless BowlingBag.valid_params?(params)
      redirect "/bags/new?error=invalid golf bag"
    end
    BowlingBag.create(params)
    redirect "/bags"
  end
end