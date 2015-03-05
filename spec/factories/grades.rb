FactoryGirl.define do
  factory :grade do
    sequence :name do |i|
      "Cycle #{i}"
    end
    year 1
    institution
  end
end
