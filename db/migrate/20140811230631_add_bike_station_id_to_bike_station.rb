class AddBikeStationIdToBikeStation < ActiveRecord::Migration
  def change
  	add_column :bike_stations, :bike_station_id, :integer
  end
end
