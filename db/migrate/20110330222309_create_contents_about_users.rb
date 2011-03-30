class CreateContentsAboutUsers < ActiveRecord::Migration
  def self.up
    create_table :contents_about_users do |t|
      t.integer :content_id
      t.integer :user_id

      t.timestamps
    end
  end

  def self.down
    drop_table :contents_about_users
  end
end
