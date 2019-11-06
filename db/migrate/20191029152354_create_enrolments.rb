class CreateEnrolments < ActiveRecord::Migration[6.0]
  def change
    create_table :enrolments do |t|
      t.string :name
      t.string :course_name
      t.references :user, null: false, foreign_key: true
      t.references :course, null: false, foreign_key: true

      t.timestamps
    end
  end
end
