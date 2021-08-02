class PaymentController < ApplicationController
  
  def index

  end
  
  def create
    @cart = Cart.find(session[:cart_id])
    # because @cart return object of hashes i needed to map through @cart object and get the value of the name, price and quantity
    line_items = @cart.line_items.map do |item|
      {
        price_data: {
          currency: 'aud',
          product_data: {
              name: item.food_item.name,
            },
          unit_amount: (item.food_item.price * 100).to_i,
        },
        quantity: item.quantity,
      }
    end

    Stripe.api_key = Rails.application.credentials.dig(:stripe_api_key)
    session = Stripe::Checkout::Session.create({
    payment_method_types: ['card'],
    line_items: line_items,
    mode: 'payment',
    # These placeholder URLs will be replaced in a following step.
    success_url: "http://127.0.0.1:3000/?check=success",
    cancel_url: 'http://127.0.0.1:3000/cancel',
  })
  redirect_to session.url
  end

end
