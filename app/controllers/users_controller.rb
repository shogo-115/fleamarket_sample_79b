class UsersController < ApplicationController

  def show
    @nick_name = current_user.nick_name
  end
  
  def logout
  end

  def new
  end
  
end
