When /^I update the (\d+)(?:st|nd|rd|th) question$/ do |pos, fields|
  within("#questionsList div:nth-child(#{pos.to_i})") { click_link "Edit" }
  fields.rows_hash.each { |name, value| When %{I fill in "#{name}" with "#{value}"} }
  click_button "Save"
end

Given /^the following questions:$/ do |questions|
  Given %{signed in}
  questions.hashes.each { |attributes| @user.questions.create!(attributes) }
end

When /^I submit a new question$/ do
  Given %{signed in}
  When  %{I fill in "What's your question?" with "How can I upgrade my plan?"}
  And   %{I fill in "Give more details as much as you can" with "I can't find the place to update my account."}
  And   %{I press "Save"}
end

Then /^I should see it in the messages board$/ do
  Then "should see success message"
  page.should have_content('How can I upgrade my plan?')
end

When /^I delete the (\d+)(?:st|nd|rd|th) question$/ do |pos|
  within("#questionsList div:nth-child(#{pos.to_i})") { click_link "Delete" }
end