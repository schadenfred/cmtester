class User < ActiveRecord::Base
  has_many :contents_about_users
  has_many :contents, :through => :contents_about_users
end
