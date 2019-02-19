class Api::V1::ProductsController < ApplicationController
protect_from_forgery with: :null_session
before_action :set_product, only: [:edit, :update, :destroy, :show]

  def index

    @products = Product.all
    render json: @products
    
  end

  def show
  	    render json: @product, status: 200
  end

  def new
    @product = Product.new
  end
  
def create
    @product = Product.create(product_params)

    if @product.save
      render json: @product, status: :created, location: @product
    else
      render json: @product.errors, status: :unprocessable_entity
    end
  end

  def update
    if @product.update(product_params)
      render json: @product
    else
      render json: @product.errors, status: :unprocessable_entity
    end
  end

  
  def destroy
    @product.destroy
    if @product.delete
      render json: @product, status: 204, location: @product
    else
      render json: @product.errors, status: :unprocessable_entity
    end
  end



  private
  def set_product
      @product = Product.find(params[:id])
    end
    def product_params
      params.require(:product).permit(:name, :price)
    end
end
