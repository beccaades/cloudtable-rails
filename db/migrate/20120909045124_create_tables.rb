class CreateTables < ActiveRecord::Migration
  def change
    create_table :tables do |t|
      t.string :token
      t.integer :restaurant_id

      t.timestamps
    end
  end
end
