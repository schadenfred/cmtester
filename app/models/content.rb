class Content < ActiveRecord::Base
  belongs_to :by_user, :class_name => 'User'

  has_many :contents_about_users
  has_many :about_users, :class_name => 'User', :through => :contents_about_users, :foreign_key => 'content_id'
  
  validates_presence_of :by_user
  validates_associated :by_user
end
