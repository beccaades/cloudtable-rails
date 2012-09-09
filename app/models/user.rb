class User < ActiveRecord::Base
  attr_accessible :email, :name, :oauth_expires_at, :oauth_token, :provider, :uid, :username, :first_name, :last_name, :gender, :profile_pic

  has_many :orders
end
