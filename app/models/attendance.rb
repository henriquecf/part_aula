class Attendance < ActiveRecord::Base
  validates :person_id, presence: true
  
  belongs_to :meeting
  belongs_to :person
end
