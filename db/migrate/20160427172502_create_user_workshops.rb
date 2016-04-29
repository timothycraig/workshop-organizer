class CreateUserWorkshops < ActiveRecord::Migration
  def change
    create_table :user_workshops do |t|
      t.belongs_to :user, null: false
      t.belongs_to :workshop, null: false
      t.timestamps null: false
    end
  end
end
