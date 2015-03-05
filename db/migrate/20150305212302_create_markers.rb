class CreateMarkers < ActiveRecord::Migration
  def change
    create_table :markers do |t|
      t.float :lat
      t.float :long

      t.timestamps null: false
    end
  end
end
