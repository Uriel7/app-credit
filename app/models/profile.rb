class Profile < ApplicationRecord
  belongs_to :user

  def is_completed?
    self.attributes.each { |name, value| return false if value.blank? }
    true
  end
end
