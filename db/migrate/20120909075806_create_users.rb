class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :email
      t.string :provider
      t.string :uid
      t.string :username
      t.string :oauth_token
      t.datetime :oauth_expires_at
      t.string :first_name
      t.string :last_name
      t.string :profile_pic
      t.string :gender

      t.timestamps
    end
  end
end
