class AddCommentToAnimals < ActiveRecord::Migration[6.0]
  def change
    add_column :animals, :comment, :text
  end
end
