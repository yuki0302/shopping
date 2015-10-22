ActiveRecord::Base.establish_connection(ENV['DATABASE_URL']||"sqlite3:db/development.db")

class Cart < ActiveRecord::Base
  has_many :items, through: :cart_items
end

class Item < ActiveRecord::Base
  belongs_to :category
  has_many :carts, through: :cart_items 
end

class CartItem < ActiveRecord::Base
  belongs_to :cart
  belongs_to :item
end

class Category < ActiveRecord::Base
  has_many :items
end

class User < ActiveRecord::Base
  has_secure_password
end

unless ENV['RACK_ENV'] == 'production'
  ActiveRecord::Base.establish_connection("sqlite3:db/development.db")
end

cg = Category.new
cg.items = Item.where(category_id: cg.id).all