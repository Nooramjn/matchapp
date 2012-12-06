require 'factory_girl' 

FactoryGirl.define do
  
	factory :fan do
		name "Sara"
		email "sara@hotmail.com"
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
		
		
		