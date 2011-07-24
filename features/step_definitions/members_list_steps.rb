Given /^some answers and questions$/ do
  Given %{signed in}

  popular  = User.create!(
    name: "Popular",
    email: "popular@me.com",
    password: "123456",
    password_confirmation: "123456"
  )

  newbie  = User.create!(
    name: "Newbie",
    email: "newbie@me.com",
    password: "123456",
    password_confirmation: "123456"
  )

  question = Question.create!(owner: newbie, title: "How do this?", body: "Lorem...")
  2.times { Answer.create!(owner: popular, question: question, body: "Lorem...") }
end

Then /^I should see members ordered by his popularity$/ do
  within("#membersList tbody tr:first-child")  { page.should have_content "Popular" }
  within("#membersList tbody tr:nth-child(2)") { page.should have_content "Joao"    }
  within("#membersList tbody tr:last-child")   { page.should have_content "Newbie"  }
end