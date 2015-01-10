require 'nokogiri'
require 'open-uri'

class HomeController < ApplicationController

	def index

		@stations = BikeStation.all

		@doc = Nokogiri::HTML(open("http://www.thehubway.com/data/stations/bikeStations.xml")) 



		if @stations.count == 0
                        #initial count in the database 

                        puts 'STARTS HERE'

                        parse_xml(@doc)
        else

            puts "Station count is: #{@stations.count}"

            update_stations(@doc,@stations) #method 
        end


        #after I have updated the database respond with encoded JSON of each object 

        bike_json = BikeStation.all


        # ActiveSupport::JSON.encode(bike_json) 

        respond_to do |format|
            format.html
            format.json { render json: bike_json }
        end


    end


    private

    def parse_xml(document)
        document.xpath("//station").each do |node|
                bikeStationid = node.xpath("id").text
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



            BikeStation.create( bike_station_id:bikeStationid, name:name, terminal_name:terminalName, last_comm_with_server:lastCommWithServer, lat:lat, long:long, installed:installed, locked:locked, install_date:installDate, removal_date:removalDate, temporary:temporary, public_station:publicStation, num_of_bikes:numOfBikes, num_of_empty_docks:numOfEmptyDocks, latest_updated_time:latestUpdateTime)
        end

    end



    def update_stations(document,bikestations)

                    #this is used to update the most frequently changing station info  

    # update attributes  - numOfBikes, numOfEmptyDocks, latestUpdateTime, locked, lastCommWithServer,   check what is - pubicStaion, temporary


        document.xpath("//station").each do |node|
            bsid = node.xpath("id").text  # get the id of the stations first 

            last_Comm_With_Server = node.xpath("lastcommwithserver").text
            locked = node.xpath("locked").text
            num_Bikes = node.xpath("nbbikes").text
            num_Empty_Docks = node.xpath("nbemptydocks").text
            latest_Update_Time = node.xpath("latestupdatetime").text

        #puts ""
            #puts "bike station id #{bsid}"

        #NOTE: make sure the order is correct 
            # 1.find the station by id 
            station = BikeStation.find_by(bike_station_id: bsid) 
            #2. update all attributes of that particular station
#            station.update_attributes(last_comm_with_server:last_Comm_With_Server, locked:locked, num_of_bikes:num_Bikes, num_of_empty_docks:num_Empty_Docks, latest_updated_time:latest_Update_Time ) 



            
            # I need to get the bikeStation id 
=begin
            @user = User.find_by(id: 1)
     now if you want to update the user's name and password, you can do
    either

     @user.update(name: "ABC", pass: "12345678")
    or

     @user.update_attributes(name: "ABC", pass: "12345678")

=end


            #BikeStation.update_attributes( :nbBikes => @numOfBikes)



=begin 
        bikestations.each do |bks|
         .update_attributes( :nbBikes => @numOfBikes )

         
=end
    #puts "end of update "
    #puts ""
        end #end of document loop
    end #end of method
end



