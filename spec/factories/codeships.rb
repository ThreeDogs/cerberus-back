# == Schema Information
#
# Table name: codeships
#
#  id              :integer          not null, primary key
#  test_code_id    :integer
#  total_report_id :integer
#  created_at      :datetime
#  updated_at      :datetime
#

# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :codeship do
    test_code nil
    total_report nil
  end
end
