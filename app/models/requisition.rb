class Requisition < ApplicationRecord
  belongs_to :user
  has_many :personal_references

  # validates_presence_of :income, :address_years, :company_years, :marital_status,
  #                       :requested_amount, :payment_terms, :bank, :comment, :company_name,
  #                       :company_phone_number, :dependents_number, :company_position, :has_sgmm,
  #                       :has_imss, :has_car

  validates_numericality_of :income, :requested_amount, greater_than: 1
  validates_numericality_of :address_years, :company_years, :dependents_number, only_intege: true

  accepts_nested_attributes_for :personal_references
end