class PurchasesController < ApplicationController
  before_action :authenticate_user!, only: :index
  before_action :set_item, only: [:index, :create]

  def index
    @purchase_shipping_address = PurchaseShippingAddress.new
    redirect_to root_path if current_user.id == @item.user_id || @item.purchase.present?
  end

  def create
    @purchase_shipping_address = PurchaseShippingAddress.new(purchase_params)
    if @purchase_shipping_address.valid?
      @purchase_shipping_address.save
      redirect_to root_path
    else
      render :index
    end
  end

  private

  def purchase_params
    params.require(:purchase_shipping_address).permit(:postal_code, :prefecture_id, :municipalities, :address, :building_name, :phone_num).merge(
      user_id: current_user.id, item_id: @item.id
    )
  end

  def set_item
    @item = Item.find(params[:item_id])
  end
end
