When /^I am on the home page$/ do
   visit root_path
end

Then /^I should not see "(.*?)"$/ do |statement|
   page.should_not have_content(statement)
end

Given /^I go to the home page$/ do
    visit root_path
end

When /^I follow the "(.*?)" link$/ do |linkname|
  click_link linkname
end

Then /^I should see "(.*?)" in the "(.*?)"$/ do |output, tagname|
  page.should have_css(tagname, :text => output)
end
