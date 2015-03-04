class Enrollment < ActiveRecord::Base
  belongs_to :person
  belongs_to :grade
  
  validates :role, presence: true
end
