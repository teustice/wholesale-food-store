class ReviewsController < ApplicationController

  def new
    @product = Product.find(params[:product_id])
    @review = @product.reviews.new
  end

  def create
    @product = Product.find(params[:product_id])
    @review = @product.reviews.new(review_params)
    @review.rating = @review.rating.to_i
    if @review.save
      flash[:notice] = "Review successfully added!"
      redirect_to product_path(@review.product)
    else
      render :new
    end
  end

  def edit
    @product = Product.find(params[:product_id])
    @review = @product.reviews.find(params[:id])
    render :edit
  end

  def update
    @product = Product.find(params[:product_id])
    @review = @product.reviews.find(params[:id])
    if @review.update(review_params)
      redirect_to product_path(@review.product)
    else
      render :edit
    end
  end

  def destroy
    @product = Product.find(params[:product_id])
    @review = @product.reviews.find(params[:id])
    @review.destroy
    flash[:alert] = "Review has been deleted"
    redirect_to product_path(@review.product)
  end


private
  def review_params
    params.require(:review).permit(:author, :content, :rating)
  end
end
