class Institution < ActiveRecord::Base
  validates :name, presence: true
  
  has_many :grades
end
