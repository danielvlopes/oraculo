require 'spec_helper'

describe Answer do

    describe "validations" do
      let(:question) { Answer.new }

      it "is invalid without body" do
        question.should_not be_valid
        question.should have(1).error_on(:body)
      end

      it "requires a question" do
        question.should_not be_valid
        question.should have(1).error_on(:question)
      end

      it "requires an owner" do
        question.should_not be_valid
        question.should have(1).error_on(:owner)
      end
    end

end
