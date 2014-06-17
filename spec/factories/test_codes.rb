# == Schema Information
#
# Table name: test_codes
#
#  id                :integer          not null, primary key
#  import_code_java  :string(255)
#  import_code_class :string(255)
#  project_id        :integer
#  created_at        :datetime
#  updated_at        :datetime
#

# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :test_code do
    import_code_java "MyString"
    import_code_class "MyString"
    project nil
  end
end
