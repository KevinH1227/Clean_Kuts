class ChatroomsController < ApplicationController
  # def index
  #   @chatroom = Chatroom.all
  # end

  def show
    @chatroom = Chatroom.find(params[:id])
  end
end