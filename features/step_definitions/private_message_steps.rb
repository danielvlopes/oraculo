Given /^a message exists with the following information:$/ do |table|
  table.hashes.each { |attributes| Message.create! attributes }
end

When /^I click the private inbox link$/ do
  visit messages_path
end

When /^I click the private message link$/ do
  visit new_message_path
end

When /^I click the private message link for ([A-Za-z]+)$/ do |username|
  user = User.where(:name => username).first
  visit "#{new_message_path}?receiver_id=#{user.id}"
end

When /^I click on the 1st message$/ do
  within("#messages div:nth-child(1)") { click_link "From: Vinicius" }
end

Then /^I should see ([A-Za-z]+) as the receiver$/ do |username|
  within("#receiver_name") do
    page.should have_content('Rafael')
  end
end

Then /^I should be able to select the receiver$/ do
  within("#new_message div:nth-child(3)") do
    page.should have_css("#message_receiver_id")
  end
end

Then /^I should see (\d+) messages?$/ do |count|
  within("h3") do
    message_count = "#{count} " + ((count.to_i == 1) ? "message" : "messages")
    page.should have_content(message_count)
  end
end

