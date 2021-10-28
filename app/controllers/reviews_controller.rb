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

  def edit
    @review = Review.find(params[:id])
  end

  def create
    @review = Review.new(review_params)

    authorize @review

    if @review.save
      redirect_to edit_review_path, notice: "Your review has been successfully created"
    else
      render :new
    end
  end

  def update
    @review = Review.find(params[:id])

    if @review.update_attributes(params[:review])
      redirect_to @review
    else
      flash[:error] = "There was an error updating your review"
      redirect_to @barber
    end
  end

  def destroy
    @review = Review.find(params[:id])
    @review.destroy
    redirect_to(@barber)
  end
end

private

def review_params
  params.require(:review).permit(:client_id, :title, :comment, :date, :rating)
end
