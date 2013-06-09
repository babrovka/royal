class UsersController < ApplicationController
  def show
    @user = current_user
    @cart = current_cart
  end
end
