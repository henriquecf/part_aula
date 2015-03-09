class Institution < ActiveRecord::Base
  validates :name, presence: true
  
  has_many :grades, inverse_of: :institution
  has_many :people, inverse_of: :institution
end
