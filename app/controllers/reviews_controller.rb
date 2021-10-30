class ReviewsController < ApplicationController
  def index
    @reviews = Review.all
  end

  def show
    @review = Review.find(params[:id])
  end

  def new
    @barber = User.find(params[:user_id])
    @review = Review.new
  end

  def create
    @barber = User.find(params[:user_id])
    @review = Review.new(
      barber_id: params[:user_id],
      client: current_user,
      comment: review_params[:comment],
      rating: review_params[:rating],
    )
    if @review.save
      redirect_to user_path(@barber)
    else
      flash[:alert] = "Something went wrong."
      render :new
    end
  end

  def edit
    @review = Review.find(params[:id])

    if @review.update_attributes(params[:review])
      redirect_to @review
    else
      flash[:error] = "There was an error updating your review"
      redirect_to @client
    end
  end

  def destroy
    @review = Review.find(params[:id])
    @review.destroy
    redirect_to(@client)
  end
end

private

def review_params
  params.require(:review).permit(:user_id, :comment, :rating)
end
