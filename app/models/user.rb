class User < ActiveRecord::Base
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable,
         :confirmable

  attr_accessible :email, :password, :password_confirmation, :remember_me, :name, :timezone, :receive_email_notifications

  has_many :questions

  validates_presence_of :name
end
