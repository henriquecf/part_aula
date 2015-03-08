FactoryGirl.define do
  factory :person do
    name "MyString"
    date_of_birth "2015-03-03"
    sequence :email do |i|
      "email#{i}@example.com"
    end
    gender "M"
    phone "MyString"
  end

end
