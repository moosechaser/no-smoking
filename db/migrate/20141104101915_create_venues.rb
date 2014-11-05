class CreateVenues < ActiveRecord::Migration
  def change
    create_table :venues do |t|
      t.string :name
      t.string :latitude
      t.string :longitude
      t.string :link
      t.string :address
      t.integer :venue_type
      t.integer :smoking_policy

      t.timestamps
    end
  end
end
