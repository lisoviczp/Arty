class MessagesController < ApplicationController
  before_action :set_message, only: [:show, :edit, :update, :destroy]

  respond_to :html

  def index
    @messages = Message.all
    respond_with(@messages)
  end

  def show
    respond_with(@message)
  end

  def new
    @message = Message.new
    respond_with(@message)
  end

  def edit
  end

  def create
    @message = Message.new(message_params)
    @message.save
    respond_with(@message)
  end

  def update
    @message.update(message_params)
    respond_with(@message)
  end

  def destroy
    @message.destroy
    respond_with(@message)
  end

  def accept
    @message = Message.find(params[:id])  
    @message.accept_message
    @message.save
    redirect_to root_path
  end

  def decline
    @message = Message.find(params[:id])
    @message.decline_message
    @message.save
    redirect_to root_path
    
  end

  private
    def set_message
      @message = Message.find(params[:id])
    end

    def message_params
      params.require(:message).permit(:comment, :due_date, :price, :artist_id, :user_id, :accepted)
    end
end
