class AddAncestryToComments < ActiveRecord::Migration[6.0]
  def change
    add_column :comments, :ancestry, :integer, :default => 0
    add_column :comments, :ind, :integer, :default => 0
  end
end
