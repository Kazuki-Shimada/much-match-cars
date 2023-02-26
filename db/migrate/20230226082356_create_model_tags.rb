class CreateModelTags < ActiveRecord::Migration[6.1]
  def change
    create_table :model_tags do |t|
      t.references :model, null: false, foreign_key: true
      t.references :tag, null: false, foreign_key: true

      t.timestamps
    end
  end
end
