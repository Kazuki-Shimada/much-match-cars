class CreateCars < ActiveRecord::Migration[6.1]
  def change
    create_table :cars do |t|
      t.integer :user_id, null: false
      t.integer :type_id, null: false
      t.integer :model_year
      t.timestamps
    end
  end
end
