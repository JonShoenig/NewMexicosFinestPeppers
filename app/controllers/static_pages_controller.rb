class StaticPagesController < ApplicationController
  def index
  end
  def landing_page
  	@featured_product = Product.last
  	@products = Product.all
  end
end
