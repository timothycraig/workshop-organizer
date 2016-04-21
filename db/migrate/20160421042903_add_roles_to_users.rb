class AddRolesToUsers < ActiveRecord::Migration
  def change
    add_column :users, :role, :string, null: false, default: "attendee"
  end
end
