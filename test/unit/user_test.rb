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

require 'test_helper'

class UserTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
