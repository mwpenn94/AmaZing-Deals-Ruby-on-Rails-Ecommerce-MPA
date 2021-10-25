class SessionsController < ApplicationController
  # This is required because of a quirk the "developer" authentication
  # strategy. We'll remove this when we move to a "real" provider.
  skip_before_action :verify_authenticity_token, only: :create

  def new
    @user = User.new()
  end

  def create
    @user = User.find_or_create_by(id: auth['uid']) do |u|
      u.username = auth['info']['nickname']
      u.email = "placeholder"
      u.password = "placeholder"
    end

    session[:user_id] = @user.id
    redirect_to user_path(@user)
  end

  def destroy
    session.delete("user_id")
    redirect_to root_path
  end

  private

  def auth
    request.env['omniauth.auth']
  end
end
