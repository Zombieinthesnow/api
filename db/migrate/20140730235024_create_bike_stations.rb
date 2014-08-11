class CreateBikeStations < ActiveRecord::Migration
  def change
    create_table :bike_stations do |t|
      t.string :name
      t.string :terminalName
      t.integer :lastCommWithServer
      t.integer :lat
      t.integer :long
      t.string :installed
      t.string :locked
      t.integer :installDate
      t.integer :removalDate
      t.string :temporary
      t.string :public
      t.integer :nbBikes
      t.integer :nbEmptyDocks
      t.integer :latestUpdateTime

      t.timestamps
    end
  end
end
