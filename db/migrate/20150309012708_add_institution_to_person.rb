class AddInstitutionToPerson < ActiveRecord::Migration
  def change
    add_reference :people, :institution, index: true
    add_foreign_key :people, :institutions
  end
end
