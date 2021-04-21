class ListingsController < ApplicationController
  before_action :authenticate_user!, only: [:new, :create, :edit, :update, :destroy]
  before_action :set_listing,        only: [:show, :edit, :update, :destroy]
  before_action :move_to_index,      only: [:update, :destroy]

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
  end

  def edit
    if current_user.id == @listing.user.id
      render :edit
    else
      redirect_to root_path
    end
  end

  def update
    if @listing.update(listing_params)
      redirect_to listing_path(@listing)
    else
      render :edit
    end
  end

  def destroy
    if @listing.destroy
      redirect_to root_path
    else
      redirect_to root_path
    end
  end

  private

  def listing_params
    params.require(:listing).permit(:image, :product_name, :description, :category_id, :status_id, :shipping_burden_id,
                                    :prefectures_id, :shipping_days_id, :price)
          .merge(user_id: current_user.id)
  end

  def set_listing
    @listing = Listing.find(params[:id])
  end

  def move_to_index
    redirect_to action: :index if current_user.id != @listing.user.id
  end
end
