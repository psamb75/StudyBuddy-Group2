class CreateNotes < ActiveRecord::Migration[6.0]
  def change
    create_table :notes do |t|
      t.string :course_code
      t.string :title
      t.string :tag
      t.string :user_name
      t.string :timeline
      t.string :location
      t.references :course, null: false, foreign_key: true

      t.timestamps
    end
  end
end
