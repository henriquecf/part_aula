class Person < ActiveRecord::Base
  validates :name, presence: true
  validates :email, uniqueness: true
  
  has_many :enrollments
  has_many :grades, through: :enrollments
end
