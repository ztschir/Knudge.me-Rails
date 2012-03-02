class YodleeContentServiceInfo < ActiveRecord::Base
    self.table_name = "yodleeContentServiceInfo"

  
  # Relationships
  has_many :user_content_services

end