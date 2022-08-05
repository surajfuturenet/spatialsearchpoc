class CreateConservations < ActiveRecord::Migration[7.0]
  def change
    create_table :conservations do |t|
      t.string :name
      t.string :address
      t.integer :polygonid
      t.integer :partid
      t.integer :pointid
      t.float :longitude
      t.float :latitude
      t.string :description

      t.timestamps
    end
  end
end
