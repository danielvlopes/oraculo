class AddReceiveEmailNotificationsToUser < ActiveRecord::Migration
  def self.up
    add_column :users, :receive_email_notifications, :boolean
  end

  def self.down
    remove_column :users, :receive_email_notifications
  end
end
