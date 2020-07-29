class AddReasonToAnimals < ActiveRecord::Migration[6.0]
  def change
    change_table :animals do |t|
      t.string :reason
    end
  end
end

