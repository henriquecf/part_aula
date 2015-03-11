class ParentChild < ActiveRecord::Base
  belongs_to :parent, class_name: "Person"
  belongs_to :child, class_name: "Person"
  
  validates :parent_id, uniqueness: { scope: :child_id }
end