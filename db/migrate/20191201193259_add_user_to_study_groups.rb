class AddUserToStudyGroups < ActiveRecord::Migration[6.0]
  def change
    add_reference :study_groups, :user, foreign_key: true
  end
end
