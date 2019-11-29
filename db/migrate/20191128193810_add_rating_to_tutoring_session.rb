class AddRatingToTutoringSession < ActiveRecord::Migration[6.0]
  def change
    add_column :tutoring_sessions, :rating, :Integer
    add_column :tutoring_sessions, :completed, :boolean, :default => false
  end
end
