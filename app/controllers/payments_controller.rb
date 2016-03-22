class PaymentsController < ApplicationController
	# POST/payments
	def create
		token = params[:stripeToken]
		@product = Product.find(params[:product_id])
		@user = current_user
		# Create the charge on Stripe's servers, this will charge user's card
		begin
			charge = Stripe::Charge.create(
				:amount => @product.price * 100, # amount in cents again
				:currency => "usd",
				:source => token,
				:description => params[:stripeEmail]
				)
			if charge.paid
				Order.create(
					product_id: @product,
					user_id: @user,
					total: @product.price * 100
					)
				flash[:success] = "Thank you for your order."
			end
		rescue Stripe::CardError => e
			# The card has been declined
			body = e.json_body
			err = body[:error]
			flash[:error] = "There was an error processing your request: #{err[:message]}"
		end
		redirect_to product_path(@product)
	end
end
