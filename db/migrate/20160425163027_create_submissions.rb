class CreateSubmissions < ActiveRecord::Migration
  def change
    create_table :submissions do |t|
      t.belongs_to :workshop, null: false
      t.belongs_to :user, null: false
      t.boolean 'approved', null: false, default: false
    end
  end
end
