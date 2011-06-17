Then /should see success message/ do
  page.should have_css(".notice")
end

Then /^I should see error messages$/ do
  page.body.should match(/error_explanation/m)
end

Then /^an email with subject "([^"]*)" should have been sent to (.*)$/ do |subject, email|
  sent = ActionMailer::Base.deliveries.last
  sent.subject.should == subject
  sent.to.first.should == email
end
