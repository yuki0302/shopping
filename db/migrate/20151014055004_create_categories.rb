class CreateCategories < ActiveRecord::Migration
  create_table :categories do |t|
      t.string :name
      t.timestamps null: false
  end
end