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

class User < ActiveRecord::Base
  has_one :cart
  has_many :items
end

unless ENV['RACK_ENV'] == 'production'
  ActiveRecord::Base.establish_connection("sqlite3:db/development.db")
end
class User < ActiveRecord::Base
  has_secure_password
end