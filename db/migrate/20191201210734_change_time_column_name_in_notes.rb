class ChangeTimeColumnNameInNotes < ActiveRecord::Migration[6.0]
  def change
    rename_column :study_groups, :time, :date
  end
end
