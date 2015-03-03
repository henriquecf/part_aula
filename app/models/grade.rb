class Grade < ActiveRecord::Base
  validates :name, :year, presence: true
  validates :name, uniqueness: { scope: :year }
end
