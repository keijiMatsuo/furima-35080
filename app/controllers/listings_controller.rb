class ListingsController < ApplicationController
  before_action :authenticate_user!, only: [:new]
  def index

  end

  def new
    @listing = Listing.new
  end

  def create
    @listing = Listing.new(listing_params)
    if @listing.save
      redirect_to root_path
    else
      render :new
    end
  end

  private

  def listing_params
    params.require(:listing).permit(:image, :product_name, :description, :category_id, :status_id, :shipping_burden_id, :prefectures_id, :shipping_days_id, :price)
    .merge(user_id: current_user.id)
  end
end
