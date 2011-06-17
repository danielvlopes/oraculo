require 'spec_helper'

describe Question do

  describe "validations" do
    let(:question) { Question.new }

    it "is invalid without title" do
      question.should_not be_valid
      question.should have(1).error_on(:title)
    end

    it "is invalid without body" do
      question.should_not be_valid
      question.should have(1).error_on(:body)
    end

    it "requires an owner" do
      question.should_not be_valid
      question.should have(1).error_on(:owner)
    end
  end

end
