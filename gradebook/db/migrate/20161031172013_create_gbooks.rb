class CreateGbooks < ActiveRecord::Migration
  def change
    create_table :gbooks do |t|

      t.timestamps null: false
    end
  end
end
