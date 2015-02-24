class CreateHpSearches < ActiveRecord::Migration
  def change
    create_table :hp_searches do |t|
      t.string :name
      t.integer :zipcode

      t.timestamps null: false
    end
  end
end
