class RenamePublicStationByAddingUnderscores < ActiveRecord::Migration
  def change
  	rename_column :bike_stations, :publicStation, :public_station
  end
end
