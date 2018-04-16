class SubscriptionsController < ApplicationController
    def create
        Subscription.create(subscription_params)
        @subscribed_to_obj = subscription_params[:subscribed_to_type].singularize.classify.constantize.find(subscription_params[:subscribed_to_id])
        redirect_to @subscribed_to_obj

    end
  private
  def subscription_params
    params.permit(:user_id, :subscribed_to_id, :subscribed_to_type)
  end

end
