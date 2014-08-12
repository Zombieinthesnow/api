require 'nokogiri'
require 'open-uri'

class HomeController < ApplicationController
	def index
		@stations = BikeStation.all

		if @stations.count == 0

			doc = Nokogiri::HTML(open("http://www.thehubway.com/data/stations/bikeStations.xml")) 

			puts 'STARTS HERE'

			doc.xpath("//station").each do |node|
				id = node.xpath("id").text
				name = node.xpath("name").text
				terminalName = node.xpath("terminalname").text
				lastCommWithServer = node.xpath("lastcommwithserver").text
				lat = node.xpath("lat").text
				long = node.xpath("long").text
				installed = node.xpath("installed").text
				locked = node.xpath("locked").text
				installDate = node.xpath("installdate").text
				removalDate = node.xpath("removaldate").text
				temporary = node.xpath("temporary").text
				publicStation = node.xpath("public").text
				numOfBikes = node.xpath("nbbikes").text
				numOfEmptyDocks = node.xpath("nbemptydocks").text
				latestUpdateTime = node.xpath("latestupdatetime").text


				
				puts id
				puts name
				puts terminalName
				puts lastCommWithServer
				puts lat
				puts long
				puts installed
				puts locked
				puts installDate
				puts removalDate      #does not display anything 
				puts temporary 
				puts publicStation
				puts numOfBikes
				puts numOfEmptyDocks
				puts latestUpdateTime
				puts ""

				#BikeStation.create(attr:value, )

				BikeStation.create( bike_station_id:id, name:name, terminalName:terminalName, lastCommWithServer: lastCommWithServer, lat:lat, long:long, installed:installed, locked:locked, installDate:installDate, removalDate:removalDate, temporary:temporary, publicStation:publicStation, nbBikes:numOfBikes, nbEmptyDocks:numOfEmptyDocks, latestUpdateTime:latestUpdateTime)

				#another active record query 

				#BikeStation.where name equals ( )  #within 5 miles 

							

		end
			else
				puts @stations.count

			end
	

		#root = doc.xpath("/name").text

		
		#puts root

=begin
		def num_bikes

		  @num_bikes = Station.where(statio_name: params[:somevaluefromtheform])
      	  return "hello world"
		end


	end

=end


	end

end
