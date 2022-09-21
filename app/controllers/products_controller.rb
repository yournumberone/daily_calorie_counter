# frozen_string_literal: true

class ProductsController < ApplicationController
  def index
    @q = Product.ransack(params[:q])
    @products = @q.result(distinct: true)
    @pagy, @products = pagy(@products)
    return unless @products.size.zero? && params[:q].present?

    CalorieNinjasApi.create_product(params[:q][:name_cont])
  end

  def show
    @product = find_product
  end

  def new
    @product = current_user.products.build
  end

  def create
    @product = current_user.products.new(product_params)
    if @product.save
      redirect_to root_path, notice: t('.success')
    else
      flash.now[:alert] = t('.fail')
      render :new
    end
  end

  def edit
    @product = find_product
  end

  def update
    @product = find_product
    if @product.update(product_params)
      redirect_to products_path, notice: t('.success')
    else
      flash.now[:alert] = t('.fail')
      render :edit
    end
  end

  def delete
    @product = find_product
    if @product.destroy
      redirect_to products_path, notice: t('.success')
    else
      redirect_to product_path(@product), alert: t('.fail')
    end
  end

  private

  def find_product
    Product.find(params[:id])
  end

  def product_params
    params.require(:product).permit(%i[name calories protein_g fat_total_g carbohydrates_total_g description])
  end
end
