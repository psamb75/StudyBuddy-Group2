class ChargesController < ApplicationController
    rescue_from Stripe::CardError, with: :catch_exception
    def new
    end
  
    def create
      StripeChargesServices.new(charges_params, current_user).call
      redirect_to new_charge_path
    end

    def show
      require 'stripe'
      Stripe.api_key = Rails.configuration.stripe[:secret_key]
      @charges = Stripe::Charge.list(customer: current_user.stripe_id)
    end

    private
  
    def charges_params
      params.permit(:stripeEmail, :stripeToken, :order_id)
    end
  
    def catch_exception(exception)
      flash[:error] = exception.message
    end


  end

class StripeChargesServices
  DEFAULT_CURRENCY = 'cad'.freeze
  
  def initialize(params, user)
    @stripe_email = params[:stripeEmail]
    @stripe_token = params[:stripeToken]
    #@order = params[:order_id]
    @user = user
  end

  def call
    create_charge(find_customer)
  end

  private

  attr_accessor :user, :stripe_email, :stripe_token, :order

  def find_customer
  if user.stripe_id
    retrieve_customer(user.stripe_id)
  else
    create_customer
  end
  end

  def retrieve_customer(stripe_id)
    Stripe::Customer.retrieve(stripe_id) 
  end

  def create_customer
    customer = Stripe::Customer.create(
      email: stripe_email,
      source: stripe_token
    )
    user.update(stripe_id: customer.id)
    customer
  end

  def create_charge(customer)
    Stripe::Charge.create(
      customer: customer.id,
      #amount: order_amount,
      amount: 3000,
      description: customer.email,
      currency: DEFAULT_CURRENCY
    )
  end

  #def order_amount
  #  Order.find_by(id: order).amount
  #end


  
end
