class ListingsController < ApplicationController
  before_action :authenticate_user!, only: [:new, :create]
  def index
    @listings = Listing.all.order('created_at DESC')
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

  def show
    @listing = Listing.find(params[:id])
  end

  def edit
    @listing = Listing.find(params[:id])
  end

  def update
    
  end

  private

  def listing_params
    params.require(:listing).permit(:image, :product_name, :description, :category_id, :status_id, :shipping_burden_id,
                                    :prefectures_id, :shipping_days_id, :price)
          .merge(user_id: current_user.id)
  end
end
