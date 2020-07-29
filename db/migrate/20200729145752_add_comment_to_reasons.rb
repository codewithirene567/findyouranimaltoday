class AddCommentToReasons< ActiveRecord::Migration[6.0]
  def change
    change_table :reasons do |t|
      t.text :comment
    end
  end
end

