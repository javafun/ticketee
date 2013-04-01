# Given /^I am on the homepage$/ do
#   visit('/')
# end
# When /^I navigate to the new project creation page$/ do
#   click_link('New Project')
# end
# When /^I create a new project$/ do
#   fill_in('Name', :with => 'TextMate 2')
#   click_button('Create Project')
# end

# Then /^I should be shown the project created verification message$/ do
#   page.should have_content("Project has been created.")
# end

# Then /^I should be on the project page for the new project$/ do
#   current_path.should == project_path(Project.find_by_name!('TextMate 2'))
#   page.should have_content("TextMate 2 - Projects - Ticketee")
# end

require File.expand_path(File.join(File.dirname(__FILE__), "..", "support", "path"))

Given /^(?:|I )am on the (.+)$/ do |page_name|
  visit path_to(page_name)
end

When /^I follow "(.*?)"$/ do |link|
  click_link(link)
end

When /^I fill in "(.*?)" with "(.*?)"$/ do |field, value|
  fill_in(field, :with => value)
end

When /^I press "(.*?)"$/ do |button|
  click_button(button)
end

Then(/^I should see "(.*?)"$/) do |text|
  if page.respond_to? :should
    page.should have_content(text)
  else
    assert page.has_content?(text)
  end
end


Then /^(?:|I )should be on (.+)$/ do |page_name|
  current_path = URI.parse(current_url).path
  if current_path.respond_to? :should
    current_path.should == path_to(page_name)
  else
    assert_equal path_to(page_name), current_path
  end
end



