class CreateProducts < ActiveRecord::Migration
  # To change this template use File | Settings | File Templates.
  def change
    create_table :products do |t|
      t.string :name
      t.string :descript
      t.float :price

      t.timestamps
    end
  end
end