require 'spec_helper'

describe User do

  describe ".by_activity" do

    it "shoud retrieve users ordered by his activity" do
      normal   = user_factory email: "normal@me.com"
      popular  = user_factory email: "popular@me.com"
      newbie   = user_factory email: "newbie@me.com"
      question = mock_model(Question, owner: newbie, title: "Lorem")

      2.times { answer_factory(owner: popular, question: question) }
      answer_factory(owner: normal, question: question)

      users = User.by_activity
      users.first.email.should  == "popular@me.com"
      users.second.email.should == "normal@me.com"
      users.last.email.should   == "newbie@me.com"
    end

  end

end