class PaymentController < ApplicationController
  
  def index

  end
  
  def create
    @food_item = FoodItem.find(params[:food_item_id])
    Stripe.api_key = Rails.application.credentials.dig(:stripe_api_key)
    session = Stripe::Checkout::Session.create({
    payment_method_types: ['card'],
    line_items: [{
      price_data: {
        currency: 'aud',
        product_data: {
          name: "food",
        },
        unit_amount: subtotal * 100,
      },
      quantity: 1,
    }],
    mode: 'payment',
    # These placeholder URLs will be replaced in a following step.
    success_url: "http://127.0.0.1:3000/food_items/?check=success",
    cancel_url: 'http://127.0.0.1:3000/cancel',
  })
  redirect_to session.url
  end

end
