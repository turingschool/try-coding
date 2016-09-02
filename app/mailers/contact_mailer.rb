class ContactMailer < ApplicationMailer
	include SendGrid

	def form_request(name, reason, message)
		@name    = name
		@reason  = reason
		@message = message

		mail(to: 'contact@turing.io', subject: 'Try Turing Contact Request')
	end
end
