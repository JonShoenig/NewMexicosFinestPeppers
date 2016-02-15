class ApplicationController < ActionController::Base
	
	def index
	end

	def show
	end

	def new
	end

	def create
	end

	def destroy
	end
	

  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
	rescue_from CanCan::AccessDenied do |exception|
  redirect_to main_app.root_url, :alert => exception.message
end
  
end


