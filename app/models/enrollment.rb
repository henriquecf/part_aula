class Enrollment < ActiveRecord::Base
  belongs_to :person
  belongs_to :grade
  
  validates :person_id, uniqueness: {scope: :grade_id}
  validates :role, :person_id, :grade_id, presence: true
end
