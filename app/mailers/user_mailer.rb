class UserMailer < ApplicationMailer
  default from: "cfgameshub@gmail.com"

  def contact_form(email, name, message)
    @message = message
    mail( to: 'm.menahi@gmail.com',
    subject: "A new contact form message from #{name}, #{email}")
  end
end
