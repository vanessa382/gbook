class AddGbookIdToAssignments < ActiveRecord::Migration
  def change
    add_column :assignments, :gbook_id, :integer
  end
end
