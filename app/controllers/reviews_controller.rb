class ReviewsController < ApplicationController
  def index
    @reviews = Review.all
  end

  def show
    @review = Review.find(params[:id])
  end

  def new
    @review = Review.new
  end

  def create
    @review = Review.new(review_params)
    @review.user = current_user
    if @review.save
      redirect_to new_review_path
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
  params.require(:review).permit(:client_id, :title, :comment, :rating)
end
