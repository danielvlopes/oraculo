class MembersController < ApplicationController

  before_filter :authenticate_user!

  def index
    @members = User.by_activity
    respond_with @members
  end

end
