class Question < ActiveRecord::Base
  has_many :answers
  belongs_to :owner, :class_name => "User", :foreign_key => "user_id"

  validates_presence_of :title, :body,:owner
  validates_associated :owner

  scope :search_title, lambda { |terms|
    where("title LIKE :t OR body LIKE :t", t: "%#{terms}%")
  }

  scope :search_author, lambda { |terms|
    joins(:owner).where("users.name LIKE :n OR body LIKE :n", n: "%#{terms}%")
  }

  scope :search_date, lambda { |start_at, end_at|
    where("questions.created_at >= ? AND questions.created_at <= ? ", "#{start_at} 00:00:00", "#{end_at} 23:59:99" )
  }
end
