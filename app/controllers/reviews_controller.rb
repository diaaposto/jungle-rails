class ReviewsController < ApplicationController

    def create
      review = current_user.reviews.new(
        product_id: params[:product_id],
        description: review_params[:description],
        rating: review_params[:rating]
      )

      if review.save
        flash[:error] = "Review cannot be empty."
      
        redirect_to :back
      else
        redirect_to product_path(params[:product_id])
      end
    end

    def destroy
      @review_id = params[:id]
      @product_id = params[:product_id]

      @review = Review.find(@review_id)
      @review.destroy
      redirect_to product_path(:id => @product_id)
    end

  private
  
  def review_params
    params.require(:review).permit(:description, :rating)
  end
end

