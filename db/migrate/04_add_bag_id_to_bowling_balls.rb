class AddBagIdToBowlingBalls < ActiveRecord::Migration
  def change
    add_column :bowling_balls, :bowling_bag_id, :integer
  end
end