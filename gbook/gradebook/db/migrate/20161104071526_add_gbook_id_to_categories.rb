class AddGbookIdToCategories < ActiveRecord::Migration
  def change
    add_column :categories, :gbook_id, :integer
  end
end
