class Person < ActiveRecord::Base
  validates :name, :gender, :institution, presence: true
  validates :gender, inclusion: { in: %w[M m F f] }
  validates :email, uniqueness: { scope: :institution }, allow_blank: true,
                    format: { with: /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\z/i }
  
  belongs_to :institution
  has_many :enrollments, inverse_of: :person
  has_many :grades, through: :enrollments
  has_many :attendances, inverse_of: :person
  has_many :meetings, through: :attendances

  has_many :parent_children, foreign_key: "parent_id", class_name: "ParentChild"
  has_many :child_parents, foreign_key: "child_id", class_name: "ParentChild"
  has_many :parents, through: :child_parents
  has_many :children, through: :parent_children
  
  scope :exclude, ->(*people){ where.not(id: people) }
  scope :match_last_name, ->(last_name){ where("name like '%#{last_name}'") }
  scope :name_like, ->(name){ where("name like '%#{name}%'") }
  
  def last_name
    name.split.last
  end
  
  def probable_parents
    Person.match_last_name(last_name).exclude(self)
  end
end
