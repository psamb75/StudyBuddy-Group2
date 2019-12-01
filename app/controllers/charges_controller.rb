class ChargesController < ApplicationController
    rescue_from Stripe::CardError, with: :catch_exception
    def new
    end
  
    def create
    end

    def show
      require 'stripe'
      Stripe.api_key = Rails.configuration.stripe[:secret_key]
      @charges = Stripe::Charge.list(customer: current_user.stripe_id)
    end

    def checkout
      charge_info = params[:charge_info]
      StripeChargesServices.new(charge_info, current_user).call
      redirect_to dashboard_path
    end

    private
    def catch_exception(exception)
      flash[:error] = exception.message
    end


  end

class StripeChargesServices
  DEFAULT_CURRENCY = 'cad'.freeze
  
  def initialize(params, user)
    @stripe_email = params[:stripeEmail]
    @card_token = params[:stripeToken]
    @amount = params[:amount].to_i
    @description = params[:description]
    @user = user
  end

  def call
    create_charge(find_customer)
  end

  private

  attr_accessor :user, :stripe_email, :card_token, :amount, :description

  def find_customer
  if user.card_token
    retrieve_customer(user.card_token)
  else
    create_customer
  end
  end

  def retrieve_customer(card_token)
    Stripe::Customer.retrieve(card_token) 
  end

  def create_customer
    customer = Stripe::Customer.create(
      email: stripe_email,
      source: card_token
    )
    user.update(card_token: customer.id)
    customer
  end

  def create_charge(customer)
    Stripe::Charge.create(
      customer: customer.id,
      amount: amount,
      description: description,
      currency: DEFAULT_CURRENCY
    )
  end
end
