class Meeting < ActiveRecord::Base
  validates :date, :grade, presence: true
  
  belongs_to :grade
  has_many :attendances, inverse_of: :meeting
  has_many :people, through: :attendances
  accepts_nested_attributes_for :attendances
end
