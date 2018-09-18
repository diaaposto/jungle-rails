class ProductsController < ApplicationController

  def index
    @products = Product.order(created_at: :desc)
  end

  def show
    # byebug now try to fetch localhost:3000/products/12 and then check in your terminal
    # type params[:id] in your terminal gives me back the string "12"
    # what is params? it's a hash with controller products action show id 12
    # so maybe its a bug because its a string and not a number
    #type next into terminal to move forward, type continue type help if you need it - there's step, up, next, step steps into methods
    #you can request the page again and type next and then @product and then @product.name = "New Name"
   # type continue and reload your browser, pretty cool
    @product = Product.find params[:id]
    if current_user 
      @review = Review.find_by(product_id: params[:id], user_id: current_user[:id])
    else
      @review = Review.new
    end
  end

end


