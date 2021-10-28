class ChatroomsController < ApplicationController
  def show
    @chatroom = Chatroom.find(params[:id])
    @message = Message.new
  end

  def create
    @chatroom = Chatroom.create
    # raise
    redirect_to chatroom_path(@chatroom)
  end
end
