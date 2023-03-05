class CreateReviews < ActiveRecord::Migration[6.1]
  def change
    create_table :reviews do |t|
      t.integer :user_id, null: false
      t.integer :type_id, null: false
      t.string :title, null: false
      t.string :body, null: false
      t.integer :rate, null: false
      t.integer :design, null: false
      t.integer :driving_performance, null: false
      t.integer :cost, null: false
      t.integer :size, null: false
      t.integer :safety, nyll: false
      t.timestamps
    end
  end
end
