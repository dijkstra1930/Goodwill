class CreateProducts < ActiveRecord::Migration
def self.up
create_table "bids", :id => false do |t|
t.column "product_id", :integer, :null => false
t.column "user_id",  :integer, :null => false
end
end
def change
create_table :products do |t|
t.string :name
t.string :descript
t.float :price

t.timestamps
end
end
end
