class BuysController < ApplicationController
  def new
    @address = Address.find_by(user_id: current_user.id)
  end
end
