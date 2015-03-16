class Meeting < ActiveRecord::Base
  validates :date, :grade, presence: true
  validates :date, uniqueness: {scope: :grade_id}
  
  belongs_to :grade
  has_many :attendances, inverse_of: :meeting
  has_many :people, through: :attendances
  accepts_nested_attributes_for :attendances
end
