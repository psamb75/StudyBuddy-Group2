class ChangeDateFormatOfNotes < ActiveRecord::Migration[6.0]
  def change
    remove_column :study_groups, :time
    add_column :study_groups, :time, :datetime
  end
end
