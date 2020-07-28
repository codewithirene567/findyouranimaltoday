class AddAnimalIdToReasons < ActiveRecord::Migration[6.0]
  def change
    change_table :reasons do |t|
      t.integer :animal_id
    end
  end
end
