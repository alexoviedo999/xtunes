Rails.configuration.stripe = {
  :publishable_key => ENV['PUBLISHABLE_KEY'],
  :secret_key      => ENV['SECRET_KEY']
}

Stripe.api_key = Rails.configuration.stripe[:secret_key]

#Is this the way to put keys in for production and local?  I get a nomethod error.

# if Rails.env == "production"
#   # set credentials from ENV hash
#   stripe = {"app_id" => ENV['PUBLISHABLE_KEY'], "secret" => ENV['SECRET_KEY']}
# else
#   # get credentials from YML file
#   stripe = YAML.load(File.open(Rails.root.join("config/stripe.yml")))
# end

# Stripe.api_key = stripe["secret"]
# PUBLISHABLE_KEY = stripe["app_id"]