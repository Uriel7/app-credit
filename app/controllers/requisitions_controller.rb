class RequisitionsController < ApplicationController
  before_action :require_user
  before_action :set_requisition, only: [:edit, :update, :show]

  def index
    @requisitions = current_user.requisitions
  end

  def new
    @requisition = current_user.requisitions.new
  end

  def create
    @requisition = current_user.requisitions.new(requisition_params)
    head :unproccessable_entity unless @requisition.save
  end

  def show
  end

  def edit
    render 'new'
  end

  def update
    head :unproccessable_entity unless @requisition.update(requisition_params)
  end

  private
  def set_requisition
    @requisition = current_user.requisitions.find(params[:id])
  end

  def requisition_params
    params.require(:requisition)
    .permit(
      :income, :address_years, :company_years, :marital_status,
      :requested_amount, :payment_terms, :bank, :comment, :company_name,
      :company_phone_number, :dependents_number, :company_position, :has_sgmm,
      :has_imss, :has_car,
      personal_references_attributes: [ 
        :id, :first_name, :second_name, 
        :first_last_name, :second_last_name, :cell_phone_number
      ]
    )
  end
end
