class MessagesController < ApplicationController

  before_filter :authenticate_user!

  # GET /messages
  # GET /messages.xml
  def index
    @messages = current_user.messages
    respond_with(@messages)
  end

  # GET /messages/1
  # GET /messages/1.xml
  def show
    @message = Message.find(params[:id])
    respond_with(@message)
  end

  # GET /messages/new
  # GET /messages/new.xml
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

  # GET /messages/1/edit
  def edit
    @message = Message.find(params[:id])
  end

  # POST /messages
  # POST /messages.xml
  def create
    @message = Message.new(params[:message])
    if @message.save
      MessageMailer.notify_private_message_sent(@message.sender, @message.receiver).deliver
      puts "FOI"
    end
    respond_with(@message)
  end

  # PUT /messages/1
  # PUT /messages/1.xml
  def update
    @message = Message.find(params[:id])
    @message.update_attributes(params[:message])
    respond_with(@message)
  end

  # DELETE /messages/1
  # DELETE /messages/1.xml
  def destroy
    @message = Message.find(params[:id])
    @message.destroy
    respond_with(@message)
  end
end

