class UserMailer < ApplicationMailer
  default from: "cfgameshub@gmail.com"

  def contact_form(email, name, message)
    @message = message
    mail( to: 'cfgameshub@gmail.com',
    subject: "A new contact form message from #{name}")
  end
end
