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

  describe "scopes" do
    let(:owner) { User.create(:name => 'Joao', :password => '123456', :email => 'joao@gmail.com') }
    let(:question) { Question.create(:title => 'Rails', :body => 'I want', :created_at => Date.today - 30.days, :owner => owner)}
    before(:each) do
      question
    end

    describe "#search_title" do
      subject{Question.search_title(question.title)}
      its(:size){should >= 1}

      it do
        subject.all?{ |r| r.title == question.title }.should be_true
      end
    end

    describe "search_author" do
      subject{Question.search_author('Joao')}
      its(:size){should >= 1}

      it do
        subject.all? { |r| r.owner == question.owner}.should be_true
      end
    end

    describe "search_date" do
      subject{Question.search_date(Date.today - 30.days, Date.today)}
      its(:size){should >= 1}

      it do
        subject.all?{ |r| r.created_at == question.created_at }.should be_true
      end
    end
  end
end