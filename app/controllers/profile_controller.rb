class ProfileController < ApplicationController
  before_action :require_user
  before_action :set_profile, only: [:edit, :update]

  def edit
  end

  def update
    @profile.update(profile_params)
    redirect_to root_path
  end

  private

  def set_profile
    @profile = current_user.profile
  end

  def profile_params
    params.require(:profile).permit(
      :first_name, :second_name, :first_last_name, 
      :second_last_name, :birth_date, :curp, :rfc, 
      :gender, :birth_state, :phone_number
    )
  end
end
