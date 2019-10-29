class CreateAttendees < ActiveRecord::Migration[6.0]
  def change
    create_table :attendees do |t|
      t.string :event_name
      t.string :user_name
      t.references :user, null: false, foreign_key: true
      t.references :study_group, null: false, foreign_key: true

      t.timestamps
    end
  end
end
