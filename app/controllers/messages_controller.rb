class MessagesController < ApplicationController

  before_filter :authenticate_user!

  def index
    @messages = current_user.messages
    respond_with(@messages)
  end

  def show
    @message = current_user.messages.find(params[:id])
    respond_with(@message)
  end

  def new
    @message = Message.new
    @message.sender = current_user

    if params[:receiver_id] != nil && params[:receiver_id].to_i > 0 then
      @message.receiver_id = params[:receiver_id].to_i
      @users = nil
    else
      @users = User.all
    end

    respond_with(@message)
  end

  def edit
    @message = current_user.messages.find(params[:id])
  end

  def create
    @message = current_user.messages.new(params[:message])
    @message.save
    respond_with(@message)
  end

  def update
    @message = current_user.messages.find(params[:id])
    @message.update_attributes(params[:message])
    respond_with(@message)
  end

  def destroy
    @message = current_user.messages.find(params[:id])
    @message.destroy
    respond_with(@message)
  end
end

