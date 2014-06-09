# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :network_info do
    response_size 1
    request_size 1
    client_timestamp 1
  end
end
