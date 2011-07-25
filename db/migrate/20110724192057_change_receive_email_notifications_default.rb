class ChangeReceiveEmailNotificationsDefault < ActiveRecord::Migration
  def self.up
    change_column_default :users, :receive_email_notifications, true
  end

  def self.down
    change_column_default :users, :receive_email_notifications, nil
  end
end
