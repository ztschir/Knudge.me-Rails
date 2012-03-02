class UserContentService < ActiveRecord::Base
    self.table_name = "userContentService"
  
  # Relationships
  has_one :users
  has_one :yodlee_content_service_infos
  
  attr_accessible :content_tokens
  attr_reader :content_tokens

  def content_tokens=(ids)
    self.content_service_ids = ids.split(",").first
  end
end