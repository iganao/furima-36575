class CreateItems < ActiveRecord::Migration[6.0]
  def change
    create_table :items do |t|
      t.string :product_name,        null: false
      t.string :description,         null: false
      t.integer :category_id,         null: false
      t.integer :condition_id,        null: false
      t.integer :postage_id,          null: false
      t.integer :region_id,           null: false
      t.integer :shopping_date_id,    null: false
      t.integer :price,               null: false
      t.references :user,                null: false, foreign_key: true
      t.timestamps
    end
  end
end
