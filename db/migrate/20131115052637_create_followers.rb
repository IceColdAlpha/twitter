class CreateFollowers < ActiveRecord::Migration
  def change
    create_table :followers do |t|
      t.integer :follower
      t.integer :following
      t.timestamps
    end
  end
end
