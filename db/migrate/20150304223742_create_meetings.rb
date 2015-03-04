class CreateMeetings < ActiveRecord::Migration
  def change
    create_table :meetings do |t|
      t.date :date
      t.belongs_to :grade, index: true

      t.timestamps null: false
    end
    add_foreign_key :meetings, :grades
  end
end
