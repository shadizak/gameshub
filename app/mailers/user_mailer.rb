class UserMailer < ApplicationMailer
  default from: "Games Hub"

  def contact_form(email, name, message)
    @message = message
    mail( to: 'cfgameshub@gmail.com',
    subject: "A new contact form message from #{name}, #{email}")
  end

  def welcome(user)
    @appname = "Games Hub"
    mail(to: user.email,
    subject: "Welcome to #{@appname}!")
  end
  def payment_confirmation(user, product)
    @purchaser = user
    @purchased_product = product
    @app_name = "Game Hub"
    mail(to: user.email,
    subject: "Payment Confirmation Notification, #{@app_name}")
  end
end
