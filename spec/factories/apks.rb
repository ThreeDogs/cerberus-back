# == Schema Information
#
# Table name: apks
#
#  id         :integer          not null, primary key
#  apk        :string(255)
#  test_apk   :string(255)
#  created_at :datetime
#  updated_at :datetime
#

# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :apk do
    apk "MyString"
    test_apk "MyString"
  end
end
