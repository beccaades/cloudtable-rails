class CreateRatings < ActiveRecord::Migration
  def change
    create_table :ratings do |t|
      t.integer :menu_item_id
      t.integer :order_item_id
      t.integer :user_id
      t.integer :score

      t.timestamps
    end
  end
end
