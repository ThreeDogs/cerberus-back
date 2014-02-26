# == Schema Information
#
# Table name: projects
#
#  id         :integer          not null, primary key
#  name       :string(255)
#  user_id    :integer
#  created_at :datetime
#  updated_at :datetime
#

# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :project do
  	name "Sample Project"
  	user_id 1
  end

  factory :init_project, parent: :project do
  	name "First Project"
  	user_id 1
  end

  factory :invalid_project, parent: :project do
  	name nil
  	user_id nil
  end
end
