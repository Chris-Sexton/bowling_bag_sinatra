class CreateBowlingBags < ActiveRecord::Migration
  def change
    create_table :bowling_bags do |t|
      t.string :name
      t.integer :capacity
    end
  end
end