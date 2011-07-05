class ImageBelongsToQuestion < ActiveRecord::Migration
  def self.up
    change_table :images do |t|
      t.belongs_to :question
    end
  end

  def self.down
    change_table :images do |t|
      t.remove_belongs_to :question
    end
  end
end