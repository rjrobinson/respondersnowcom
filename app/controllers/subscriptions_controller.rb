# frozen_string_literal: true

class SubscriptionsController < ApplicationController
  PLANS = {
    monthly: "plan_DuKIPvnVwvCihp",
    quarterly: "plan_DuKIdNEtQJkETt",
    annualy: "plan_DuKJDShbBYh7wT",
  }

  def new
  end

  def create
    customer = if current_user.stripe_id?
      Stripe::Customer.retrieve(current_user.stripe_id)
    else
      Stripe::Customer.create(email: current_user.email)
    end

    current_user.update_stripe_data(stripe_data: {
      stripe_id: customer["id"],
      stripe_token: params["stripeToken"],
    })

    current_user.create_subscription(plan: PLANS[:monthly])

    redirect_back(fallback_location: settings_path(current_user), flash: { notice: 'Welcome!' })
  end

  def reactivate
    current_user.create_subscription(plan: PLANS[:monthly])

    redirect_back(fallback_location: settings_path(current_user), flash: { notice: 'Subscription has been activated' })
  end

  def destroy
    current_user.cancel_subscription

    redirect_back(fallback_location: settings_path(current_user), flash: { notice: 'Subscription has been canceled' })
  end
end
