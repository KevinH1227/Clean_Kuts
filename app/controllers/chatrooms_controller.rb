class ChatroomsController < ApplicationController
  def show
    @recipient_id = params[:recipient_id]
    @chatroom = Chatroom.find(params[:id])
    @message = Message.new
  end

  def new
    @chatroom = Chatroom.create
    redirect_to chatroom_path(@chatroom, recipient_id: params[:recipient_id])
  end

  def my_chatrooms
    @chatrooms = current_user.received_messages.map(&:chatroom).uniq if current_user.barber?
  end
end
