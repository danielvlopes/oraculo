class Question < ActiveRecord::Base
  has_many :answers
  has_many :images, :dependent => :destroy
  belongs_to :owner, :class_name => "User", :foreign_key => "user_id"

  accepts_nested_attributes_for :images

  validates_presence_of :title, :body, :owner
  validates_associated :owner
end
