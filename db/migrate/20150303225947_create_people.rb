class CreatePeople < ActiveRecord::Migration
  def change
    create_table :people do |t|
      t.string :name
      t.date :date_of_birth
      t.string :email
      t.string :phone

      t.timestamps null: false
    end
  end
end
