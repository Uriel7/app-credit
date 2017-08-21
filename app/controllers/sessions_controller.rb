class SessionsController < ApplicationController
  def new
  end

  def create
    user = User.from_omniauth(request.env["omniauth.auth"])
    if user.persisted?
      session[:user_id] = user.id
      current_user.make_profile(request.env["omniauth.auth"]) unless current_user.has_profile?
      redirect_to edit_profile_path(current_user.id)
    end
  end

  def destroy
    session[:user_id] = nil
    redirect_to root_url
  end
end
