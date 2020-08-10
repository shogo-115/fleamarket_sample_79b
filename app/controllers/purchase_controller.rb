class PurchaseController < ApplicationController

  require 'payjp'

  def index
    @address = Address.find_by(user_id: current_user.id)
    @product = Product.find_by(id: params[:format])
    @proImgs = @product.images
    card = Card.where(user_id: current_user.id).first
    if current_user.id == @product.user_id || @product.soldout == 1
      redirect_to root_path
    else
      if card.blank?
        redirect_to controller: "card", action: "new"
      else
        Payjp.api_key = Rails.application.credentials.payjp[:private_key]
        customer = Payjp::Customer.retrieve(card.customer_id)
        @default_card_information = customer.cards.retrieve(card.card_id)
      end
    end
  end

  def pay
    card = Card.where(user_id: current_user.id).first
    Payjp.api_key = Rails.application.credentials.payjp[:private_key]
    Payjp::Charge.create(
    :amount => Product.find_by(id: params[:format]).price,
    :customer => card.customer_id,
    :currency => 'jpy'
    )
    product = Product.find_by(id: params[:format])
    product.update(:soldout => 1, :buyerId => current_user.id)
    redirect_to action: 'done' 
  end

  def done
  end

end