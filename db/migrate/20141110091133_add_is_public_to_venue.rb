class AddIsPublicToVenue < ActiveRecord::Migration
  def change
    add_column :venues, :is_public?, :boolean
  end
end
