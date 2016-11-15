class AddUserIdToBowlingBags < ActiveRecord::Migration
  def change
    add_column :bowling_bags, :user_id, :integer
  end
end