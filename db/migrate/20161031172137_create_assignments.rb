class CreateAssignments < ActiveRecord::Migration
  def change
    create_table :assignments do |t|
      t.string :name
      t.float :point_total

      t.timestamps null: false
    end
  end
end
