class Client < ActiveRecord::Base
  has_many :consultations

  def full_name
    "#{first_name} #{last_name}"
  end
end
