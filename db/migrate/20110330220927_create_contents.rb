class CreateContents < ActiveRecord::Migration
  def self.up
    create_table :contents do |t|
      t.string :subject
      t.text :body
      t.integer :by_user_id
      t.integer :about_user_id

      t.timestamps
    end
  end

  def self.down
    drop_table :contents
  end
end
