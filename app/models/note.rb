class Note < ActiveRecord::Base
  belongs_to :consultation
  belongs_to :note_template
  belongs_to :client
end
