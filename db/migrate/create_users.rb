class CreateUsers < ActiveRecord::Migration
  # To change this template use File | Settings | File Templates.
  def change
    create_table :users do |t|
      t.string :username
      t.string :email

      t.timestamps
    end
  end

end