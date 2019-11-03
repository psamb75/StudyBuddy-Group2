class CreateStudyGroups < ActiveRecord::Migration[6.0]
  def change
    create_table :study_groups do |t|
      t.string :event_name
      t.string :name
      t.string :location
      t.string :time
      t.string :description
      t.string :course_code
      t.references :course, null: false, foreign_key: true

      t.timestamps
    end
  end
end
