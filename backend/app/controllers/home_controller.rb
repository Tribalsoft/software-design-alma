class HomeController < ApplicationController
  def index
    @home_video = HomeVideo.first_or_initialize
    @categories = Category.all
    @latest_products = Product.order(created_at: :desc).limit(4)
  end
end
