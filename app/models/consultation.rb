class Consultation < ActiveRecord::Base
  belongs_to :client
  belongs_to :practitioner
  belongs_to :consultation_type
  has_many :transactions

end


