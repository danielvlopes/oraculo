require 'spec_helper'

describe Answer do

  describe "validations" do
    let(:answer) { Answer.new }

    it "is invalid without body" do
      answer.should_not be_valid
      answer.should have(1).error_on(:body)
    end

    it "requires a question" do
      answer.should_not be_valid
      answer.should have(1).error_on(:question)
    end

    it "requires an owner" do
      answer.should_not be_valid
      answer.should have(1).error_on(:owner)
    end
  end

  describe "email notifications when create answer" do
    let(:owner) { user_factory(question_owner_notification: true) }
    let(:question) { question_factory(owner: owner) }

    it "notifies the question owner" do
      mailer = mock(AnswerMailer, deliver: true)
      AnswerMailer.should_receive(:question_owner_notification).and_return(mailer)
      answer_factory(question: question, owner: owner)
    end

    it "should not notify owner when he not desire" do
      owner = mock_model(User, :receive_email_notifications? => false)
      Answer.any_instance.stub(:owner).and_return(owner)
      AnswerMailer.should_not_receive(:question_owner_notification)
    end
  end

end