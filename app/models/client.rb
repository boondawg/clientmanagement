class Client < ActiveRecord::Base
  has_many :consultations
  has_many :notes

  def full_name
    "#{first_name} #{last_name}"
  end
end
