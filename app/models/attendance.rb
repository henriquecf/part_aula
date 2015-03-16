class Attendance < ActiveRecord::Base
  validates :person_id, presence: true
  validates :person_id, uniqueness: {scope: :meeting_id}
  
  belongs_to :meeting
  belongs_to :person
end
