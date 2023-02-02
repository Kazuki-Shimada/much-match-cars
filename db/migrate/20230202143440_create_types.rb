class CreateTypes < ActiveRecord::Migration[6.1]
  def change
    create_table :types do |t|
      t.integer :model_id
      t.string :name, null: false
      t.integer :capacity
      t.integer :displacement
      t.boolean :is_selling
      t.timestamps
    end
  end
end
