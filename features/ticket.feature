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
    
Scenario: Creating a new match
	Given I am on the 'new match' page
	When I select "Friendly" for "match_type"
	When I select false for "home"
  And I click on "submit" button 
	Then I should see "Match was successfully created." in the "p#notice"
	
Scenario: Update match
  Given I am on the 'match' page
  When I follow the "Edit" link for "Friendly"
  And I change the subject "" to ""
  And I click on "Update" button 
  Then I should see "Match was successfully updated." in the "p#notice"
  
Scenario: Delete match
   Given I am on the 'match' page
   When I follow the "Destroy" link for "Friendly"
    Then I should not see "Friendly"


    Scenario: List Fans
  Given I am on the 'fans' page
  Then I should see "Manchester United FC | Fans" in the "title"
  And I should see "fans" in the "h1"
  And I should see "Name" in the "th"
  And I should see "Email" in the "th"
  And I should see "Sara" in the "td"
  And I should see "sara@hotmail.com" in the "td"
  And I should see a link to "show" in the "td"
  And I should see a link to "edit" in the "td"
  And I should see a link to "destroy" in the "td"
    And I should see a link to "Sign up" in the "a"
    
Scenario: Creating a new fan
	Given I am on the 'new fans' page
	When I enter "Sara" for "Name" box
	And I enter "sara@hotmail.com" for "Email" box
	And I enter "foobar" for "Password" box
	And I enter "foobar" for "Confirmation" box
    And I click on "Create Fan" button 
	Then I should see "Welcome!" in the "p#notice"
	


Scenario: Update fan
  Given I am on the 'walkers' page
  When I follow the "Edit" link for "Sara"
  And I change the Name "Sara" to "Sarah"
  And I click on "Update" button 
  Then I should see "Fan was successfully updated." in the "p#notice"
  
Scenario: Delete fan
    Given I am on the 'fans' page
    When I follow the "Destroy" link for "Sarah"
    Then I should not see "Sarah"
