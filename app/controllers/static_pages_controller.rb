class StaticPagesController < ApplicationController
  def index
  	@products = Product.all
  end
  def landing_page
  	@featured_product = Product.last
  	@products = Product.all
  end
  def contact
  	@products = Product.all
  end
  def about
  	@products = Product.all
  end
end
