class PersonalReferencesController < ApplicationController
  before_action :set_reference

  def show
  end

  private

  def set_reference
    @personal_reference = PersonalReference.find(params[:id])
  end
end