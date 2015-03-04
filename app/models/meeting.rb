class Meeting < ActiveRecord::Base
  belongs_to :grade
  
  validates :date, presence: true
end
