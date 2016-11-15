class BowlingBallsController < ApplicationController 
  get "/ball" do
    redirect_if_not_logged_in 
    @ball = BowlingBall.all
    erb :'bowling_ball/index'
  end

  get "/ball/new" do
    redirect_if_not_logged_in 
    @error_message = params[:error]
    erb :'bowling_ball/new'
  end

  get "/ball/:id/edit" do
    redirect_if_not_logged_in 
    @error_message = params[:error]
    @ball = BowlingBall.find(params[:id])
    erb :'bowling_ball/edit'
  end

  post "/ball/:id" do
    redirect_if_not_logged_in 
    @ball = BowlingBall.find(params[:id])
    unless BowlingBall.valid_params?(params)
      redirect "/ball/#{@ball.id}/edit?error=invalid bowling ball"
    end
    @ball.update(params.select{|b| b =="name" || b =="manufacturer" || b =="bowling_ball_id"})
    redirect "/ball/#{@ball.id}"
  end

  get "/ball/:id" do
    redirect_if_not_logged_in 
    @ball = BowlingBall.find(params[:id])
    erb :'golf_ball/show'
  end

  post "/ball" do
    redirect_if_not_logged_in 
    unless BowlingBall.valid_params?(params)
      redirect "/ball/new?error=invalid bowling ball"
    end
    BowlingBall.create(params)
    redirect "/ball"
  end
end