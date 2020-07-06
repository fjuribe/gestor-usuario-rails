# == Schema Information
#
# Table name: photos
#
#  id          :bigint           not null, primary key
#  description :text             default(""), not null
#  license     :integer          default("copyright")
#  name        :string(150)
#  url         :string
#  visibility  :integer
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#  user_id     :integer
#
require 'test_helper'

class PhotoTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
