class FixColumnNameToPublicStation < ActiveRecord::Migration
  def change
  	rename_column :bike_stations, :public, :publicStation
  end
end
