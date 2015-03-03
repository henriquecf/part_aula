class Grade < ActiveRecord::Base
  validates :name, :year, presence: true
end
