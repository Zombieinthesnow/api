class RenameColumnsByAddingUnderscores < ActiveRecord::Migration
  def change
  	rename_column :bike_stations, :terminalName, :terminal_name
  	rename_column :bike_stations, :lastCommWithServer, :last_comm_with_server
  	rename_column :bike_stations, :installDate, :install_date
  	rename_column :bike_stations, :removalDate, :removal_date
  	rename_column :bike_stations, :nbBikes, :num_of_bikes
  	rename_column :bike_stations, :nbEmptyDocks, :num_of_empty_docks
  	rename_column :bike_stations, :latestUpdateTime, :latest_updated_time
  end
end
