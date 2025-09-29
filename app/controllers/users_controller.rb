class UsersController < ApplicationController
  def show
     @user = User.find(params[:id])
    @gossips = @user.gossips.order(created_at: :desc)
  end
end




