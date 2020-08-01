class AddCategoryIdToAnimals < ActiveRecord::Migration[6.0]
  def change
    change_table :animals do |t|
      t.integer :category_id
    end
  end
end
