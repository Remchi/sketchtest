FactoryGirl.define do
  factory :proposal do
    name "redesign"
    user_name "Joe"
    send_date DateTime.new(2014, 01, 01)

    client

    after(:create) do |proposal|
      create_list(:proposal_section, 4, proposal: proposal)
    end
  end

  factory :client do
    name "Doe"
    company "Apple"
    website "http://www.apple.com"
  end

  factory :proposal_section do
    sequence(:name) { |n| "Name #{n}"}
    sequence(:description) { |n| "Description #{n}"}
  end
end