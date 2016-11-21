class BowlingBallsController < ApplicationController 
  get "/balls" do
    redirect_if_not_logged_in 
    @balls = BowlingBall.all
    erb :'bowling_balls/index'
  end

  get "/balls/new" do
    redirect_if_not_logged_in 
    @error_message = params[:error]
    erb :'bowling_balls/new'
  end

  get "/balls/:id/edit" do
    redirect_if_not_logged_in 
    @error_message = params[:error]
    @ball = BowlingBall.find(params[:id])
    erb :'bowling_balls/edit'
  end

  post "/balls/:id" do
    redirect_if_not_logged_in 
    @ball = BowlingBall.find(params[:id])
    unless BowlingBall.valid_params?(params)
      redirect "/balls/#{@ball.id}/edit?error=invalid bowling ball"
    end
    @ball.update(params.select{|b| b =="name" || b =="manufacturer" || b =="bowling_bag_id"})
    redirect "/balls/#{@ball.id}"
  end

  get "/balls/:id" do
    redirect_if_not_logged_in 
    @ball = BowlingBall.find(params[:id])
    erb :'bowling_balls/show'
  end

  get '/balls/:id/delete' do 
    @ball = BowlingBall.find(params[:id])
    erb :'/balls/delete'
  end

  post "/balls" do
    redirect_if_not_logged_in 
    unless BowlingBall.valid_params?(params)
      redirect "/balls/new?error=invalid bowling ball"
    end
    BowlingBall.create(params)
    redirect "/balls"
  end
end