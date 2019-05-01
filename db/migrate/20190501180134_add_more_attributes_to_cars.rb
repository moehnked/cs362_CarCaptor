class AddMoreAttributesToCars < ActiveRecord::Migration[5.2]
  def change
    add_column :cars, :horsepower, :integer
    add_column :cars, :torque, :integer
    add_column :cars, :weight, :integer
  end
end
