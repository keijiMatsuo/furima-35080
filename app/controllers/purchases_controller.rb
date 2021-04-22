class PurchasesController < ApplicationController
  before_action :authenticate_user!, only: :index

  def index 
    @listing = Listing.find(params[:listing_id])
    if current_user.id == @listing.user.id
      redirect_to root_path
    end
    @purchase = Purchase.new
  end

  def create
    @purchase = Purchase.new(purchase_params)
    if @purchase.valid?
      pay_item
      @purchase.save
      return redirect_to root_path
    else
      render 'index'
    end
  end
  
  private
  
  def purchase_params
    params.require(:purchase).permit(:price).merge(token: params[:token])
  end
  
  def pay_item
    Payjp.api_key = ENV["PAYJP_SECRET_KEY"]
    Payjp::Charge.create(
      amount: purchase_params[:price],
      card:   purchase_params[:token],
      currency: 'jpy'
    )
  end
end
