class PurchasesController < ApplicationController
  before_action :authenticate_user!

  def create
    current_cart = find_cart
    Purchase.create!(cart_id: current_cart.id, item_id: params_item)
    respond_to do |format|
      format.html { redirect_to cart_path(current_cart) }
      format.js {}
    end
  end

  def destroy
    current_cart = find_cart
    Purchase.find(params[:id]).destroy
    redirect_to cart_path(current_cart)
  end

  private

  def params_item
    params.require(:item_id)
  end
end
