# == Schema Information
#
# Table name: reports
#
#  id            :integer          not null, primary key
#  package_name  :string(255)
#  icon          :string(255)
#  app_version   :string(255)
#  os_version    :string(255)
#  device_name   :string(255)
#  country       :string(255)
#  time_for_test :decimal(, )
#  project_id    :integer
#  created_at    :datetime
#  updated_at    :datetime
#

# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :report do
    package_name "MyString"
    icon "MyString"
    app_version "MyString"
    os_version "MyString"
    time_for_test "9.99"
    project_id 1
  end
end
