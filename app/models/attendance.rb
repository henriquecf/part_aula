class Attendance < ActiveRecord::Base
  validates :person, :meeting, :present, presence: true
  
  belongs_to :meeting
  belongs_to :person
end
