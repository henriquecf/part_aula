class Attendance < ActiveRecord::Base
  validates :person, :meeting, presence: true
  
  belongs_to :meeting
  belongs_to :person
end
