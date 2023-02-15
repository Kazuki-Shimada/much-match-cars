class CreateTypes < ActiveRecord::Migration[6.1]
  def change
    create_table :types do |t|
      t.integer :model_id
      t.string :name, null: false
      t.integer :price
      t.integer :capacity
      t.integer :displacement
      t.float :fuel_consumption
      t.string :fuel
      t.boolean :is_selling
      t.timestamps
    end
  end
end
