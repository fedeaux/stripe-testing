require 'rails_helper'

RSpec.describe User, type: :model do
  it 'uses stripe web mock' do
    customer = Stripe::Customer.create(
      email: 'some.emal@example.com',
      card: StripeMock.create_test_helper.generate_card_token,
    )

    user = User.create(stripe_card_id: customer.card, stripe_customer_id: customer.id)

    charge = Stripe::Charge.create(
      amount: 1000,
      currency: 'usd',
      description: 'Charge authorization',
      source: user.stripe_customer_id,
      capture: false,
    )
  end
end
