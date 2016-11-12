class AddGbookIdToStudents < ActiveRecord::Migration
  def change
    add_column :students, :gbook_id, :integer
  end
end
