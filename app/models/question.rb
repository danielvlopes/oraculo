class Question < ActiveRecord::Base
  MAX_IMAGES_COUNT = 3

  has_many :answers
  has_many :images, :dependent => :destroy
  belongs_to :owner, :class_name => "User", :foreign_key => "user_id"

  accepts_nested_attributes_for :images

  validates_presence_of :title, :body, :owner
  validates_associated :owner
end
