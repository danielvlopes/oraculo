class Inquiry < ActiveRecord::Base

  captcha :nickname

  validates_format_of :email, :with => /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\Z/i
  validates_presence_of :name, :email, :message
  validates_inclusion_of :open, :in => [true, false]

  scope :pending, where(:open => true)
  scope :closed, xwhere(:open => false)
  
  after_create :deliver_notification

protected

  def deliver_notification
    InquiryMailer.notification(self).deliver
  end

end
