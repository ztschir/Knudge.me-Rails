class PredictedTransaction < ActiveRecord::Base
  attr_accessible :timeStamp, :name, :amount, :debitOrCredit
  
  # Relationships
  belongs_to :users
  
  
end
