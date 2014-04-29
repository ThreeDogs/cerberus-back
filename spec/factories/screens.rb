# == Schema Information
#
# Table name: screens
#
#  id               :integer          not null, primary key
#  image            :string(255)
#  client_timestamp :integer
#  created_at       :datetime
#  updated_at       :datetime
#

# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :screen do
    url "sasd"
    client_timestamp 1
  end
end
