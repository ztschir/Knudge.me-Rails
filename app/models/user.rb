# == Schema Information
#
# Table name: users
#
#  id         :integer         not null, primary key
#  firstName  :string(255)
#  middleName :string(255)
#  lastName   :string(255)
#  email      :string(255)
#  created_at :datetime
#  updated_at :datetime
#

class User < ActiveRecord::Base
  # Security feature, list all items that are accessible from web app
  attr_accessor :password
  attr_accessible :firstName, :middleName, :lastName, :email, :password, :password_confirmation
  
  # Validation
  email_regex = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  
  validates :firstName, :presence => true,
                        :length => {:maximum => 50};
  validates :lastName, :presence => true,
                       :length => {:maximum => 50};
  validates :email, :presence => true,
                    :format => { :with => email_regex },
                    :uniqueness => true;
  validates :password, :presence => true,
                       :confirmation => true,
                       :length => { :within => 6..50 }
  
  
   # Login functions
   def has_password?(submitted_password)
     encrypted_password == encrypt(submitted_password)
   end
   def self.authenticate(email, submitted_password)
     user = find_by_email(email)
     return nil if user.nil?
     return user if user.has_password?(submitted_password)
   end
  
  # Encrypting the password                     
  before_save :encrypt_password
  
  private
  def encrypt_password
    self.encrypted_password = encrypt(password)
  end
  def encrypt_password
    self.salt = make_salt if new_record? self.encrypted_password = encrypt(password)
  end
  def encrypt(string) 
    secure_hash("#{salt}--#{string}")
  end
  def make_salt 
    secure_hash("#{Time.now.utc}--#{password}")
  end
  def secure_hash(string) 
    Digest::SHA2.hexdigest(string)
  end
  
  # Relationships
  has_many :transactions
end
