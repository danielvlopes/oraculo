class Question < ActiveRecord::Base
  
  validates_presence_of :title, :body
  
end
