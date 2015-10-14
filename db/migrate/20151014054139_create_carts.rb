class CreateCarts < ActiveRecord::Migration
  create_table :carts do |t|
      t.timestamps null: false
  end
end
