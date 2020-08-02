class AddTokenToUser < ActiveRecord::Migration[6.0]
  def change
    change_table :users do |t|
      t.string :uid
      t.string :provider
    end
  end
end
