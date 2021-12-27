class SessionsController < ApplicationController
  def new
  end

  def create
    user = User.find_by(name: params[:session][:username].downcase)
    if user && user.authenticate(params[:session][:password])
      log_in user
      # redirect
    else
      flash.now[:danger] = 'Wrong name or password!'
      render 'new'
    end
  end

  def destroy
  end
end
