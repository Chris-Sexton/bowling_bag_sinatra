class CreateBowlingBalls < ActiveRecord::Migration
  def change
    create_table :bowling_balls do |t|
      t.string :name
      t.string :manufacturer
    end
  end
end