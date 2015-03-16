class Enrollment < ActiveRecord::Base
  belongs_to :person
  belongs_to :grade
  
  validates :role, :person_id, :grade_id, presence: true
end
