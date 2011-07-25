class AddCounterCacheToUser < ActiveRecord::Migration

  def self.up
    add_column :users, :questions_count, :integer, :default => 0
    add_column :users, :answers_count, :integer, :default => 0

    User.reset_column_information
    User.all.each do |u|
      u.update_attribute :questions_count, u.questions.length
      u.update_attribute :answers_count, u.answers.length
    end

  end

  def self.down
    remove_column :users, :questions_count
    remove_column :users, :answers_count
  end

end