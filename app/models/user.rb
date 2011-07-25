class User < ActiveRecord::Base
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable,
         :confirmable

  attr_accessible :email, :password, :password_confirmation, :remember_me, :name, :timezone, :receive_email_notifications

  has_many :questions
  has_many :answers
  has_many :messages, :foreign_key => "receiver_id"

  validates_presence_of :name
end

  def self.by_activity
    order("answers_count DESC")
  end

end
