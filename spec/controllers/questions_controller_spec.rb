require 'spec_helper'

describe QuestionsController do

  include Devise::TestHelpers

  def user(args={})
    @user ||= User.create({
      name: "Jonh",
      email: "jonh@gmail.com",
      password: "123456",
      password_confirmation: "123456"
    }.merge(args))
  end

  def valid_attributes
    {
      title: "Some Question",
      body: "Lorem ipsum dolor sit amet, consectetur adipisicing elit...",
      owner: user
    }
  end

  before(:each) do
    request.env['warden'] = mock(Warden, :authenticate => user,
                                         :authenticate! => user)
  end

  describe "GET index" do
    it "assigns all questions as @questions" do
      question = Question.create! valid_attributes
      get :index
      assigns(:questions).should eq([question])
    end
  end

  describe "GET show" do
    it "assigns the requested question as @question" do
      question = Question.create! valid_attributes
      get :show, id: question.id.to_s
      assigns(:question).should eq(question)
    end
  end

  describe "GET new" do
    it "assigns a new question as @question" do
      get :new
      assigns(:question).should be_a_new(Question)
    end
  end

  describe "GET edit" do
    it "assigns the requested question as @question" do
      question = Question.create! valid_attributes
      get :edit, id: question.id.to_s
      assigns(:question).should eq(question)
    end
  end

  describe "POST create" do
    describe "with valid params" do
      it "creates a new Question" do
        expect {
          post :create, question: valid_attributes
        }.to change(Question, :count).by(1)
      end

      it "assigns a newly created question as @question" do
        post :create, question: valid_attributes
        assigns(:question).should be_a(Question)
        assigns(:question).should be_persisted
      end

      it "redirects to the created question" do
        post :create, question: valid_attributes
        response.should redirect_to(Question.last)
      end
    end

    describe "with invalid params" do
      it "assigns a newly created but unsaved question as @question" do
        post :create, question: {}
        assigns(:question).should be_a_new(Question)
      end

      it "re-renders the 'new' template" do
        post :create, question: {}
        response.should render_template("new")
      end
    end
  end

  describe "PUT update" do
    describe "with valid params" do
      it "updates the requested question" do
        question = Question.create! valid_attributes
        Question.any_instance.should_receive(:update_attributes).with({'these' => 'params'})
        put :update, id: question.id, question: {'these' => 'params'}
      end

      it "assigns the requested question as @question" do
        question = Question.create! valid_attributes
        put :update, id: question.id, question: valid_attributes
        assigns(:question).should eq(question)
      end

      it "redirects to the question" do
        question = Question.create! valid_attributes
        put :update, id: question.id, question: valid_attributes
        response.should redirect_to(question)
      end
    end

    describe "with invalid params" do
      it "assigns the question as @question" do
        question = Question.create! valid_attributes
        Question.any_instance.stub(:save).and_return(false)
        put :update, id: question.id.to_s, question: {}
        assigns(:question).should eq(question)
      end

      it "re-renders the 'edit' template" do
        question = Question.create! valid_attributes
        put :update, id: question.id.to_s, question: { title: nil }
        response.should render_template("edit")
      end
    end
  end

  describe "DELETE destroy" do
    it "destroys the requested question" do
      question = Question.create! valid_attributes
      expect {
        delete :destroy, id: question.id.to_s
      }.to change(Question, :count).by(-1)
    end

    it "redirects to the questions list" do
      question = Question.create! valid_attributes
      delete :destroy, id: question.id.to_s
      response.should redirect_to(questions_url)
    end
  end

end
