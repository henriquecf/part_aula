class Person < ActiveRecord::Base
  validates :name, presence: true
  validates :email, uniqueness: true, format: { with: /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\z/i }
  
  has_many :enrollments, inverse_of: :person
  has_many :grades, through: :enrollments
  has_many :attendances, inverse_of: :person
  has_many :meetings, through: :attendances
end
