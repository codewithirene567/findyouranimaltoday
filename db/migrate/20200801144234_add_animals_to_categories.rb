class AddAnimalsToCategories < ActiveRecord::Migration[6.0]
  def change
    change_table :categories do |t|
      t.string :animals
    end
  end
end
