class RemovePriceFromCarts < ActiveRecord::Migration
  def change
  	remove_column :carts, :price, :integer
  end
end
