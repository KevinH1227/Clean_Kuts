class UsersController < ApplicationController
  def index
    @barbers = User.where(role: "barber")
  end

  def show
    @barber = User.find(params[:id])
    @previous_chat = previous_chat?
    @chatroom = set_chatroom if @previous_chat
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])
    @user.update(user_params)
    redirect_to user_path(@user)
  end

  def new
    @user = User.new
    authorize @user
  end

  def create
    @user = User.new(user_params)

    authorize @user

    if @user.save
      redirect_to edit_user_path, notice: "Your profile has been successfully created"
    else
      render :new
    end
  end

  private

  def previous_chat?
    @messages = Message.where(
      "(sender_id = ? AND recipient_id = ?)
      OR (sender_id = ? AND recipient_id = ?)",
      current_user.id, @barber.id, @barber.id, current_user.id
    )
    @messages.any?
  end

  def set_chatroom
    @messages.first.chatroom
  end

  def user_params
    params.require(:user).permit(
      :first_name,
      :last_name,
      :role,
      :email,
      :photo,
      :description,
      :address,
      :post_code,
      :phone_number,
      :service,
      :price,
      :duration
    )
  end
end
