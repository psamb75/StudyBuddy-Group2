class AddCompletedToTutors < ActiveRecord::Migration[6.0]
  def change
    add_column :tutors, :completed, :boolean, :default => false
  end
end