class CreateTutoringSessions < ActiveRecord::Migration[6.0]
  def change
    create_table :tutoring_sessions do |t|
      t.string :tutor_name
      t.string :student_name
      t.string :course_code
      t.references :user, null: false, foreign_key: true
      t.references :tutor, null: false, foreign_key: true

      t.timestamps
    end
  end
end
