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
  require 'java'
  require 'YodleeClient.jar'
  module KnudgeMeYodleeCall
    include_package "com.KnudgeMeYodlee"
  end
  # Relationships
  has_many :transactions
  has_many :predicted_transactions
  has_many :user_content_services
  has_one :categories
  
  attr_accessor :password
  attr_accessible :email, :password, :password_confirmation
  
  # Validation
  email_regex = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  
  validates :email, :presence => true,
                    :format => { :with => email_regex },
                    :uniqueness => true;
  validates :password, :presence => true,
                       :confirmation => true,
                       :length => { :within => 6..50 }
  
  
   # Login functions
   #def has_password?(submitted_password)
   # encrypted_password == encrypt(submitted_password)
   #end
   
   def self.find_by_id(id)
     find(id) rescue nil
   end
   
   def self.authenticate(email, submitted_password)
     userID = KnudgeMeYodleeCall::KnudgeMeYodlee.loginYodleeUser(email, submitted_password)
     user = find_by_id(userID)
     return nil if user.nil?
     return user
   end
   def self.authenticate_with_salt(id, cookie_salt) 
     user = find_by_id(id)
     (user && user.salt == cookie_salt) ? user : nil
   end
end
