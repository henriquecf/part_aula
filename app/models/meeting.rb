class Meeting < ActiveRecord::Base
  validates :date, presence: true
  
  belongs_to :grade
  has_many :attendances
  has_many :people, through: :attendances
end
