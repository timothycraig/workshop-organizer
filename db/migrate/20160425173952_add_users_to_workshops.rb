class AddUsersToWorkshops < ActiveRecord::Migration
  def change
    add_column :workshops, :user_id, :integer, null: false
  end
end
