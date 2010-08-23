class User < ActiveRecord::Base
  has_many :events, :through => :attendees
  
  acts_as_authentic

  email_regex = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  
  MIN_LENGTH = 6
  MAX_LENGTH = 20
  
  validates :name,     :presence     => true,
                       :length       => { :maximum => 50 }
  validates :email,    :presence     => true,
                       :format       => { :with => email_regex },
                       :uniqueness   => { :case_sensitive => false }
  validates :password, :presence     => true,
                       :confirmation => true,
                       :length       => { :within => MIN_LENGTH..MAX_LENGTH }              
  validates :login,    :uniqueness   => { :case_sensitive => false }


  def deliver_password_reset_instructions!
    reset_perishable_token!
    Mailer.deliver_password_reset_instructions(self)
  end
  
  
end