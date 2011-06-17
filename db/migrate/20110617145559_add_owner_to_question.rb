class AddOwnerToQuestion < ActiveRecord::Migration
  def self.up
    add_column :questions, :user_id, :integer
  end

  def self.down
    remove_column :questions, :user_id
  end
end
