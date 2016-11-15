class BowlingBag < ActiveRecord::Base
  has_many :bowling_balls
  belongs_to :user

  def self.valid_params?(params)
    return !params[:name].empty? && !params[:capacity].empty?
  end
end