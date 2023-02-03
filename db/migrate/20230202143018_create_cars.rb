class CreateCars < ActiveRecord::Migration[6.1]
  def change
    create_table :cars do |t|
      t.integer :user_id
      t.integer :type_id
      t.integer :model_year
      t.timestamps
    end
  end
end
