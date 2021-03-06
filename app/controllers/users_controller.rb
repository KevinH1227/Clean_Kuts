class UsersController < ApplicationController
  def index
    # @barbers = User.where(role: "barber")
    # @marker = current_user.geocoded.map({
    #   lat: current_user.latitude,
    #   lng: current_user.longitude
    # })
    if params[:query].present?
      sql_query = "first_name @@ :query OR last_name @@ :query OR address @@ :query OR post_code @@ :query"
      @barbers = User.barber.where(sql_query, query: "%#{params[:query]}%")
      @markers = @barbers.geocoded.map do |barber|
        {
          lat: barber.latitude,
          lng: barber.longitude,
          info_window: render_to_string(partial: "info1_window", locals: { barber: barber })
        }
      end
    else
      @barbers = User.where(role: "barber")
      @markers = @barbers.geocoded.map do |barber|
        {
        lat: barber.latitude,
        lng: barber.longitude,
        info_window: render_to_string(partial: "info1_window", locals: { barber: barber })
        }
      end
    end

    # @markers = @barbers.geocoded.map do |barber|
    #   {
    #     lat: barber.latitude,
    #     lng: barber.longitude,
    #     info_window: render_to_string(partial: "info1_window", locals: { barber: barber })
    #   }
    # end
  end

  def show
    @barber = User.find(params[:id])
    @previous_chat = previous_chat?
    @chatroom = set_chatroom if @previous_chat

    @appointments = @barber.barber? ?
      Appointment.all.where(barber: @barber) :
      Appointment.all.where(client: @barber)

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
