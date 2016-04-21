class CreateProfiles < ActiveRecord::Migration
  def change
    create_table :profiles do |t|
      t.belongs_to :user, null: false
      t.string :avatar_url
      t.string :company
      t.text :biography
      t.timestamps null: false
    end
  end
end
