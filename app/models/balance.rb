# == Schema Information
#
# Table name: balances
#
#  id                    :integer          not null, primary key
#  user_id               :integer
#  email                 :string(255)
#  stripe_customer_token :string(255)
#  created_at            :datetime         not null
#  updated_at            :datetime         not null
#  total                 :decimal(, )
#

class Balance < ActiveRecord::Base
  belongs_to :user
  validates_presence_of :user_id
  validates_presence_of :email

  attr_accessor :stripe_card_token

  def save_with_payment
    if valid?
      customer = Stripe::Customer.create(amount: @amount, description: user_id, card: stripe_card_token)
      self.stripe_customer_token = customer.id
      save!
    end
  rescue Stripe::InvalidRequestError => e
    logger.error "Stripe error while creating customer: #{e.message}"
    errors.add :base, "There was a problem with your credit card."
    false
  end

end
