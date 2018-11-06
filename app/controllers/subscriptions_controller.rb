class SubscriptionsController < ApplicationController

  def new
  end

  def create
    # look up
    binding.pry
    customer = if current_user.stripe_id?
                 Stripe::Customer.retrieve(current_user.stripe_id)
               else
                 Stripe::Customer.create(email: current_user.email)
               end

    subscription = customer.subscriptions.create(
        source: params[:stripeToken],
        plan: params[:plan_id]
    )

    raise subscription
  end


  def destroy
  end
end