class BowlingBall < ActiveRecord::Base
  belongs_to :bowling_bag

  def self.valid_params?(params)
    return !params[:name].empty? && !params[:manufacturer].empty?
  end
end
