ActiveRecord::Base.establish_connection(ENV['DATABASE_URL']||"sqlite3:db/development.db")

class Cart < ActiveRecord::Base
  belongs_to :user
  has_many :items
end

class Item < ActiveRecord::Base
  belongs_to :category
  belongs_to :cart
end

class Category < ActiveRecord::Base
  has_many :items
end