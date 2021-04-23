class PurchasesController < ApplicationController
  before_action :authenticate_user!, only: [:index, :create]

  def index 
    @listing = Listing.find(params[:listing_id])
    if current_user.id == @listing.user.id
      redirect_to root_path
    end
    @purchase_delivery = PurchaseDelivery.new
  end

  def create
    @listing = Listing.find(params[:listing_id])
    @purchase_delivery = PurchaseDelivery.new(purchase_params)
    if @purchase_delivery.valid?
      pay_item
      @purchase_delivery.save
      redirect_to root_path
    else
      render 'index'
    end
  end

  private

  def purchase_params
    params.require(:purchase_delivery).permit(:postal_code, :prefectures_id, :municipality, :address, :building_name, :phone_number).merge(user_id: current_user.id, listing_id: @listing.id, token: params[:token])
  end

  def pay_item
    Payjp.api_key = ENV["PAYJP_SECRET_KEY"]
    Payjp::Charge.create(
      amount: @listing.price,
      card:   purchase_params[:token],
      currency: 'jpy'
    )
  end
end
