class CreateOrders < ActiveRecord::Migration
  def change
    create_table :orders do |t|
      t.integer :restaurant_id
      t.integer :table_id
      t.integer :status

      t.timestamps
    end
  end
end
