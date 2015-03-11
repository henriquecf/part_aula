class ParentChild < ActiveRecord::Base
  validates :child_id, :parent_id, presence: true
  validates :parent_id, uniqueness: { scope: :child_id }
  validate :different_child_and_parent
  
  belongs_to :parent, class_name: "Person"
  belongs_to :child, class_name: "Person"
  
  private
  
  def different_child_and_parent
    errors.add(:child_id, "Child must be different from parent") if parent_id == child_id
  end
end