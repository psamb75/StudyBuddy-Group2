class AddDateToTutors < ActiveRecord::Migration[6.0]
  def change
    add_column :tutors, :date, :datetime
    add_column :tutors, :hours, :integer
  end
end
