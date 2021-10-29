class MessagesController < ApplicationController
  def create
    # create new message
    @message = Message.new(params_message)
    # message has to be in ONE PARTICULAR chatroom
    # PARTICULAR so ID
    @chatroom = Chatroom.find(params[:chatroom_id])
    # in ONE chatroom
    @message.chatroom = @chatroom
    # only current users
    @message.sender = current_user

    # if it works save it and show it on the page (redirect to the same page)
    # otherwise render the error on the same pag
    if @message.save
      ChatroomChannel.broadcast_to(
        @chatroom,
        render_to_string(partial: "message", locals: { message: @message })
      )
      # redirect_to chatroom_path(@chatroom, anchor: "message -#{@message.id}")
    else
      render "chatroom/show"
    end
  end

  def params_message
    params.require(:message).permit(:content, :recipient_id)
  end
end
