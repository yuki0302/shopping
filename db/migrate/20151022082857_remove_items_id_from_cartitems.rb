class RemoveItemsIdFromCartitems < ActiveRecord::Migration
  def change
  	remove_column :cart_items, :items_id, :integer
  end
end
