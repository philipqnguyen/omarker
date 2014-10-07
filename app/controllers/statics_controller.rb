class StaticController < ApplicationController
  def update
    @user = current_user
    @user.background(params[:user][:background])
    if @user.save
      redirect_to root_url
    else
      redirect_to root_url, notice: "Hey Buddy, come on!"
  end
end
