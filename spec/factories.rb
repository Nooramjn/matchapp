require 'factory_girl' 

FactoryGirl.define do
	factory :fan do
	#I took this from 9.32 but not sure for what it is?
	#sequence(:name)  { |n| "Person #{n}" }
    #sequence(:email) { |n| "person_#{n}@example.com"} 
		name "Sara"
		email "#{('a'..'z').to_a.shuffle[0..20].join}@hotmail.com"
		password "foobar"
    	password_confirmation "foobar"
    	
    	factory :admin do
        admin true
        end
		end
		
	factory :opponent do	
		name "UCI"
		skill_level "Moderate"
		home_capacity 52342
		domestic true
		rival true
	end
	
	factory :match do
		match_type "Friendly"
		home false
		association :opponent
		association :ticket
	end
	
	factory :ticket do
		quantity 1
		ticket_type "Middle Grandstand"
		association :fan
		association :match
	end
	
end
		
		
		