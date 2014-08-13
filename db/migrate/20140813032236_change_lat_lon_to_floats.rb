class ChangeLatLonToFloats < ActiveRecord::Migration
  def change
  	change_column :bike_stations, :lat, :float
  	change_column :bike_stations, :long, :float
  end
end
