class Attendance < ActiveRecord::Base
  validates :person_id, :present, presence: true
  
  belongs_to :meeting
  belongs_to :person
end
