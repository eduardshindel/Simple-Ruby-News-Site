require 'digest/md5'

class SessionsController < ApplicationController
  def new; end

  def create
    user = User.find_by(name: params[:session][:username].downcase)
    if user && user[:password] == Digest::MD5.hexdigest(params[:session][:password])
      log_in user
      redirect_to controller: 'articles', action: 'index'
    else
      flash.now[:danger] = 'Wrong name or password!'
      render 'new'
    end
  end

  def destroy; end
end
