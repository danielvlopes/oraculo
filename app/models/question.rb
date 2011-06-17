class Question < ActiveRecord::Base
  belongs_to :owner, :class_name => "User", :foreign_key => "user_id"
    
  validates_presence_of :title, :body,:owner
  validates_associated :owner
  
  
  # has_many :answers, :class_name => "Questi",
  #   :foreign_key => "manager_id"
  # belongs_to :manager, :class_name => "Employee"
  
end
