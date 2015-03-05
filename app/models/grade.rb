class Grade < ActiveRecord::Base
  validates :name, :year, :institution, presence: true
  validates :name, uniqueness: { scope: :year }
  
  belongs_to :institution
  has_many :enrollments
  has_many :people, through: :enrollments
end
