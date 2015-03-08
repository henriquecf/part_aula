class CreateParentChildren < ActiveRecord::Migration
  def change
    create_table :parent_children do |t|
      t.integer :parent_id
      t.integer :child_id
      add_foreign_key :parent_children, :people, column: "person_id", foreign_key: "parent_id"
      add_foreign_key :parent_children, :people, column: "person_id", foreign_key: "child_id"
      t.timestamps null: false
    end
  end
end
