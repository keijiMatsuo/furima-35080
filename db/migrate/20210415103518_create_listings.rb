class CreateListings < ActiveRecord::Migration[6.0]
  def change
    create_table :listings do |t|

      t.string  :product_name,       null: false
      t.text    :description,        null: false
      t.integer :category_id,        null: false
      t.integer :status_id,          null: false
      t.integer :shipping_burden_id, null: false
      t.integer :prefectures_id,     null: false
      t.integer :shipping_days_id,   null: false
      t.integer :price,              null: false

      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
