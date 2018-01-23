if Rails.env.production?
  Rails.configuration.stripe = {
    publishable_key: ENV['STRIPE_PUBLISHABLE_KEY'],
    secret_key: ENV['STRIPE_SECRET_KEY']
  }
else
  Rails.configuration.stripe = {
    publishable_key:  ENV['DEV_ENV_STRIPE_PUBLISHABLE_KEY'],
    secret_key: ENV['DEV_ENV_STRIPE_SECRET_KEY']
  }
end
Stripe.api_key = Rails.configuration.stripe[:secret_key]
