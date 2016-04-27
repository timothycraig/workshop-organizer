class AddApprovedToWorkshops < ActiveRecord::Migration
  def change
    add_column :workshops, :approved, :boolean, default: false
  end
end
