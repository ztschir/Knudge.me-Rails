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
  attr_accessible :firstName, :middleName, :lastName, :email
  
  # Validation
  email_regex = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  
  validates :firstName, :presences => true
                        :length => {:maximum => 50};
  validates :lastName, :presences => true
                       :length => {:maximum => 50};
  validates :email, :presences => true
                    :format => { :with => email_regex }
                    :uniqueness => true;
  
  # Relationships
  has_many :transactions
end
