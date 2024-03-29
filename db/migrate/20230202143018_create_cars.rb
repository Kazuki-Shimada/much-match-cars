class CreateCars < ActiveRecord::Migration[6.1]
  def change
    create_table :cars do |t|
      t.integer :user_id, null: false
      t.integer :type_id, null: false
      t.integer :manufacturer_id
      t.integer :model_year
      t.integer :model_id
      t.timestamps
    end
  end
end
