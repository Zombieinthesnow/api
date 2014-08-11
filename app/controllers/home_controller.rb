require 'nokogiri'
require 'open-uri'

class HomeController < ApplicationController
	def index
		@stations = BikeStation.all

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

			#BikeStation.create( name:'Tremont st. at Berkley St.', terminalName:'C32000', lastCommWithServer:'1406762853433', lat:'42.345392', long:'-71.069616', installed:'true', locked:'false', installDate:'1394463600000', removalDate:nil, temporary:'false', publicStation:'true', nbBikes:'11', nbEmptyDocks:'4', latestUpdateTime:'1406762852922')

			#another active record query 

			#BikeStation.where name equals ( )  #within 5 miles 

						

			end
	

		#root = doc.xpath("/name").text

		
		#puts root

	end

end
