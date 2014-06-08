# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :battery_info do
    wifi 1
    threeg 1
    lcd 1
    gps 1
    sound 1
    cpu 1
    client_timestamp 1
  end
end
