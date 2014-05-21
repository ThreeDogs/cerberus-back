# == Schema Information
#
# Table name: crashes
#
#  id               :integer          not null, primary key
#  error_name       :string(255)
#  description      :text
#  total_reports_id :integer
#  created_at       :datetime
#  updated_at       :datetime
#

# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :crash do
    error_name "MyString"
    error_line "MyString"
    description "MyText"
  end
end
