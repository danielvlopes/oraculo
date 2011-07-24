#encoding: UTF-8

Given /^no user exists$/ do
  User.delete_all
end

Given /^no user exists with email (.*)$/ do |email|
  User.delete_all(email: email)
end

Given /^I am registered as "(.*)\/(.*)"$/ do |email, password|
  @user = User.create!(
    email: email, 
    password: password, 
    name: "Jonh Doe",
    password_confirmation: password
  )
end

When /^I signup with:$/ do |fields|
  visit signup_page
  fields.rows_hash.each { |name, value| When %{I fill in "#{name}" with "#{value}"} }
  Then %{I press "Sign up"}
end

Given /^the following confirmed user:$/ do |table|  
  table.hashes.each { |attributes| user =  User.create!(attributes).confirm! }
end

Given /^an user exists with the following information:$/ do |table|
  table.hashes.each { |attributes| User.create! attributes }
end

When /^I sign in as "(.*)\/(.*)"$/ do |email, password|
  When %{I go to the sign in page}
  And %{I fill in "user_email" with "#{email}"}
  And %{I fill in "user_password" with "#{password}"}
  And %{I press "Sign in"}
end

When /^I follow the confirmation link in the email sent to (.*)$/ do |email|
  user_to_confirm = User.where(email: email).first
  user_to_confirm.should be_present
  visit user_confirmation_path(:confirmation_token => user_to_confirm.confirmation_token)
end

When /^I visit the user confirmation page with token "([^"]*)"$/ do |token|
  visit user_confirmation_path(:confirmation_token => token)
end

Then /^I should be signed in$/ do
  visit "/dashboard"
  page.should_not have_content("Você precisa estar registrado para continuar.")
  page.should have_css("div#userBox")
end

Then /^I should be signed out$/ do
  visit "/"
  page.should_not have_css("span.currentUser")
end