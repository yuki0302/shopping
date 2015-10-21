class RemoveNameFromCarts < ActiveRecord::Migration
  def change
  	remove_column :carts, :name, :string
  end
end
