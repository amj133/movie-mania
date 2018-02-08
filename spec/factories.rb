FactoryBot.define do
  factory :director do
    sequence(:name) { |n| "Title #{n}"}
  end

  factory :movie do
    title "Joe Black"
    description "Maybe brad pitt is in it?"
    director
  end

  
end
