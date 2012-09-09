class CreateRestaurants < ActiveRecord::Migration
  def change
    create_table :restaurants do |t|
      t.string :venue_id

      t.timestamps
    end
  end
end
