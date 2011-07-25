require 'spec_helper'

describe MembersController do
  
  before do
    login_and_return_user
  end

  describe "GET 'index'" do
    it "should be successful" do
      get 'index'
      response.should be_success
    end
  end

end
