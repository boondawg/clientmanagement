class Consultation < ActiveRecord::Base
  belongs_to :client
  belongs_to :practitioner
  belongs_to :consultation_type
  has_many :transactions


  def as_json(options = {})
    {
        :id => self.id,
        :title => self.client.full_name,
        :description => self.client.full_name || '',
        :start => self.start_date_time,
        :end => self.end_date_time,
        :allDay => false,
        :recurring => false,
        :url => Rails.application.routes.url_helpers.consultation_path(id)
    }
    end
end


