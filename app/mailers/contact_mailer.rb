class ContactMailer < ApplicationMailer
	include SendGrid

  def form_request(name, email, reason, message)
    @name    = name
    @email   = email
    @reason  = reason
    @message = message

    mail(
      from: "\"#{@name}\" <#{@email}>",
      to: 'contact@turing.io',
      subject: 'Try Turing Contact Request'
    )
  end
end
