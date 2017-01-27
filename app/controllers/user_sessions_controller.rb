class UserSessionsController < ApplicationController
  include UserSessionsHelper

  def new
  end

  def create
    if login(params[:email], params[:password])
      @userid = current_user
      redirect_to user_categories_path(:user_id => @userid)
    else
      flash.now.alert = "Login failed."
      render action: :new
    end
  end

  def destroy
    logout
    redirect_to(:users, notice: 'Logged out!')
  end
end
