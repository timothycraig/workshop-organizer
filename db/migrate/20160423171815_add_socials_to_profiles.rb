class AddSocialsToProfiles < ActiveRecord::Migration
  def change
    add_column :profiles, :linkedin_url, :string
    add_column :profiles, :twitter_url, :string
  end
end
