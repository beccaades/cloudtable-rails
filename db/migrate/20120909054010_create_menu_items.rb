class CreateMenuItems < ActiveRecord::Migration
  def change
    create_table :menu_items do |t|
      t.string :venue_id

      t.timestamps
    end
  end
end
