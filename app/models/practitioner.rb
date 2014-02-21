class Practitioner < ActiveRecord::Base
  has_many :consultations
end
