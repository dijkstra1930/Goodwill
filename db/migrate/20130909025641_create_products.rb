class CreateProducts < ActiveRecord::Migration
  def change
    create_table :products do |t|
      t.string :product_name
      t.float :product_price
      t.string :product_description

      t.integer :user_id

      t.timestamps
    end
    add_index :products, [:user_id, :created_at]
  end
end
