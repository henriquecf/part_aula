class CreateGrades < ActiveRecord::Migration
  def change
    create_table :grades do |t|
      t.string :name
      t.integer :year

      t.timestamps null: false
    end
  end
end
