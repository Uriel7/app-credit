class PersonalReference < ApplicationRecord
  belongs_to :requisition

  validates_presence_of  :first_name, :second_name, :first_last_name, 
                        :second_last_name, :cell_phone_number

  def complete_name
    "#{self.first_name} #{self.second_name} #{self.first_last_name} #{self.second_last_name}"
  end
end
