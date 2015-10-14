class CreateItems < ActiveRecord::Migration
  create_table :items do |t|
      t.string :name
      t.integer :price
      t.text :description
      t.string :image_url
      t.timestamps null: false
  end
end