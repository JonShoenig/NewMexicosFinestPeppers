class UserMailer < ApplicationMailer
	default from: "jon.shoenig@gmail.com"

	def contact_form(email, name, message)
	@message = message
		mail(:from => email,
				:to => 'jon.shoenig@gmail.com',
				:subject => "A new contact form message from #{name}")
	end	
end


