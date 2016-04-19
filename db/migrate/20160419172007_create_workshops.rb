class CreateWorkshops < ActiveRecord::Migration
  def change
    create_table :workshops do |t|
      t.string :title, null: false
      t.datetime :date, null: false
      t.integer :capacity, null: false
      t.text :abstract, null: false
      t.timestamps null: false
    end
  end
end
