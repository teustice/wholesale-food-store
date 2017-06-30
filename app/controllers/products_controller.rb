class ProductsController < ApplicationController
  def index
    if params['filter'] === 'local'
      @products = Product.local
    else
      @products = Product.paginate(:page => params[:page], :per_page => 10)
    end
  end

  def show
    @product = Product.find(params[:id])
  end

  def new
    @product = Product.new
  end

  def create
    @product = Product.new(product_params)
    if @product.save
      flash[:notice] = "Product successfully added!"
      redirect_to  products_path
    else
      render :new
    end
  end

  def edit
    @product = Product.find(params[:id])
    render :edit
  end

  def update
    @product= Product.find(params[:id])
    if @product.update(product_params)
      redirect_to products_path
    else
      render :edit
    end
  end

  def destroy
    @product = Product.find(params[:id])
    flash[:alert] = "#{@product.name} has been deleted"
    @product.destroy
    redirect_to products_path
  end

private
  def product_params
    params.require(:product).permit(:name, :cost, :origin)
  end
end
