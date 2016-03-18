
if Rails.env.production?
	Rails.configuration.stripe = {
		:publishable_key => ENV['STRIPE_PUBLISHABLE_KEY'],
		:secret_key => ENV['STRIPE_SECRET_KEY']
	}
else
	Rails.configuration.stripe = {
	:publishable_key => 'pk_test_BazLYAncFSKAPl1Qg6yQ7pb3',
	:secret_key => 'sk_test_hbbiQ8ttoaq8Od9Nq4Pr4K9o'
	}
end

Stripe.api_key = Rails.configuration.stripe[:secret_key]