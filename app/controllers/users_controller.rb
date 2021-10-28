class UsersController < ApplicationController
  def index
    # @barbers = User.where(role: "barber")
    if params[:query].present?
      sql_query = "first_name @@ :query OR last_name @@ :query OR address @@ :query OR post_code @@ :query"
      @barbers = User.barber.where(sql_query, query: "%#{params[:query]}%")
    else
      @barbers = User.where(role: "barber")
    end
  end

  def show
    @barber = User.find(params[:id])
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
