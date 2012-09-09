class CreateOrderItems < ActiveRecord::Migration
  def change
    create_table :order_items do |t|
      t.integer :order_id
      t.integer :quantity, :default => 1
      t.string :menu_item_id

      t.timestamps
    end
  end
end
