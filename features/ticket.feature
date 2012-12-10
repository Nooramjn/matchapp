Feature: viewer
  In order to look for tickets
  As a viewer
  I want to be able to find a ticket
	
Scenario: Do not see the default rails page
	When I am on the home page
	Then I should not see "You're riding Ruby of Rails!"
	And I should not see "About your application's environment"
	And I should not see "Create your database"
	#And I should see "Welcome Pet Owners!" in the "h1"
	  	
Scenario: View 'About Us'
	Given I go to the home page
	When I follow the "About Us" link
	Then I should see "Manchester United FC | About" in the "title"
	
Scenario: View 'Contact Us'
	Given I go to the home page
	When I follow the "Contact Us" link
	Then I should see "Manchester United FC | Contact" in the "title"
	
Scenario: View 'Privacy Policy'
	Given I go to the home page
	When I follow the "Privacy Policy" link
	Then I should see "Privacy Policy" in the "title"
	
Scenario: View webmaster information in footer

	Given I go to the home page
	Then I should see "The Smurfs" in the "footer"

Scenario: View About Us information in footer
	Given I go to the home page
	Then I should see "About Us" in the "footer"

Scenario: View Contact Us information in footer
	Given I go to the home page
	Then I should see "Contact Us" in the "footer"

Scenario: View Privacy Policy information in footer
	Given I go to the home page
	Then I should see "Privacy Policy" in the "footer"


 Scenario: List matches
  Given I am on the 'matches' page
  Then I should see "Manchester United FC | Matches" in the "title"
  And I should see "LISTING MATCHES" in the "h1"
  And I should see "match type" in the "th"
  And I should see "Home" in the "th"
  And I should see "Opponent" in the "th"
  And I should see "2012-11-21" in the "td"
  And I should see "walk my dog" in the "td"
And I should see "noora" in the "td"
    And I should see a link to "New Message" in the "a"
    
Scenario: Creating a new message
	Given I am on the 'new message' page
	When I select "2012" for "year"
	When I select "November" for "month"
	When I select "24" for "day"
	When I enter "dog walking" for "Subject" box
	And I enter "Ahmed" for "Sendername" box
	And I enter "hi" for "Content" box
	And I enter "Ali" for "Firstname" box
	And I enter "hi" for "Description" box
  And I click on "Create Walker" button 
	Then I should see "Message was successfully created." in the "p#notice"
	
Scenario: Update message
  Given I am on the 'messages' page
  When I follow the "Edit" link for "Ahmed"
  And I change the subject "dog walking" to "dog"
  And I click on "Update" button 
  Then I should see "Message was successfully updated." in the "p#notice"
  
Scenario: Delete message
   Given I am on the 'messages' page
   When I follow the "Destroy" link for "Ahmed"
    Then I should not see "Ahmed" 

  
