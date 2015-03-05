class AddFieldToGrade < ActiveRecord::Migration
  def change
    add_reference :grades, :institution, index: true
    add_foreign_key :grades, :institutions
  end
end
