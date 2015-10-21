class CreateCartItems < ActiveRecord::Migration
  def change
  	create_table :cart_items do |t|
  	 t.integer :cart_id
  	 t.integer :items_id
    end
  end
end