class YodleeContentServiceInfo < ActiveRecord::Base
  self.table_name = "yodleeContentServiceInfo"
  # Relationships
  has_many :user_content_services
  # Scopes
  scope :content_service_display_name, lambda { |name| where("contentServiceDisplayName like ?", "%#{name}%") }
  scope :select_id_and_name, select('contentServiceId as id, contentServiceDisplayName as name')

end