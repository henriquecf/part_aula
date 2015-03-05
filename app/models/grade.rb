class Grade < ActiveRecord::Base
  validates :name, :year, :institution, presence: true
  validates :name, uniqueness: { scope: :year }
  
  belongs_to :institution
  has_many :enrollments, inverse_of: :grade
  has_many :people, through: :enrollments
  has_many :meetings, inverse_of: :grade
end
