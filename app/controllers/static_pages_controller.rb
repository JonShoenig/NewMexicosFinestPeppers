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
  def thank_you
    @name = params[:name]
    @email = params[:email]
    @message = params[:message]
    ActionMailer::Base.mail(:from => @email,
      :to => 'your-email@example.com',
      :subject => "A new contact form message from #{@name}",
      :body => @message).deliver_now
  end 
end
