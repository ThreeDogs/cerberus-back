# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :test_code do
    import_code_java "MyString"
    import_code_class "MyString"
    project nil
  end
end
