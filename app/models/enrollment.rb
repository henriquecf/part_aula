class Enrollment < ActiveRecord::Base
  belongs_to :person
  belongs_to :grade
  
  validates :role, :person, :grade, presence: true
end
