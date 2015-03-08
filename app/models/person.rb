class Person < ActiveRecord::Base
  validates :name, :gender, :date_of_birth, presence: true
  validates :gender, inclusion: { in: %w[M m F f] }
  validates :email, uniqueness: true, format: { with: /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\z/i }
  
  has_many :enrollments, inverse_of: :person
  has_many :grades, through: :enrollments
  has_many :attendances, inverse_of: :person
  has_many :meetings, through: :attendances

  has_many :parent_children, foreign_key: "parent_id", class_name: "ParentChild"
  has_many :child_parents, foreign_key: "child_id", class_name: "ParentChild"
  has_many :parents, through: :child_parents
  has_many :children, through: :parent_children
end
