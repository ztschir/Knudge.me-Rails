# == Schema Information
#
# Table name: transactions
#
#  id            :integer         not null, primary key
#  user_id       :integer
#  timeStamp     :datetime
#  name          :string(255)
#  amount        :decimal(, )
#  debitOrCredit :boolean
#  category_id   :integer
#  created_at    :datetime
#  updated_at    :datetime
#

class Transaction < ActiveRecord::Base
  attr_accessible :timeStamp, :name, :amount, :debitOrCredit
  # Relationships
  belongs_to :users
  
  default_scope :order => 'transactions.created_at DESC'
end
