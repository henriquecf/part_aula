class ParentChild < ActiveRecord::Base
  validates :child_id, :parent_id, presence: true
  validates :parent_id, uniqueness: { scope: :child_id }
  
  belongs_to :parent, class_name: "Person"
  belongs_to :child, class_name: "Person"
end