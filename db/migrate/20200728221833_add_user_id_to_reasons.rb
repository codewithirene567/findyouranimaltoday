class AddUserIdToReasons < ActiveRecord::Migration[6.0]
  def change
    change_table :reasons do |t|
      t.integer :user_id
    end
  end
end
