FactoryGirl.define do
	sequence(:email) { |n| "user#{n}@example.com"}
	factory :user do
		email 
		password "12334567890"
		first_name "George"
		last_name "Harrison"
		admin false
	end
  factory :admin, class: User do
  	email 
  	password "qwertyuiop"
  	admin true
  	first_name "Admin"
  	last_name  "User"
  end
end