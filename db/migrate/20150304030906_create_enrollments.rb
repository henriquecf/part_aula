class CreateEnrollments < ActiveRecord::Migration
  def change
    create_table :enrollments do |t|
      t.string :role
      t.belongs_to :person, index: true
      t.belongs_to :grade, index: true

      t.timestamps null: false
    end
    add_foreign_key :enrollments, :people
    add_foreign_key :enrollments, :grades
  end
end
