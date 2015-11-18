require_relative 'railway_station'
 require_relative 'route'
 require_relative 'train'
 require_relative 'wagon'
 require_relative 'cargo_wagon'
 require_relative 'passanger_wagon'
 require_relative 'passanger_train'
 require_relative 'cargo_train'
 require_relative 'interface'
 require_relative 'manufacturer'

 moscow = RailwayStation.new('1', 'Moscow')
 piter = RailwayStation.new('2', 'Piter')
 rostov = RailwayStation.new('3', 'Rostov')

 route = Route.new
 route.add_station(moscow)
 route.add_station(piter)
 route.add_station(rostov)
 route.print_routes

 
 route.next_station
 train = PassangerTrain.new(315)
 train.route = route.stations
 train.go

 wagon = CargoWagon.new(1)
 passanger_wagon = PassangerWagon.new(2)
 
 train.show_station
 train.add_wagon(wagon)
 train.next_station
 train.stop
 train.add_wagon(passanger_wagon)

 puts RailwayStation.all
 puts Train.find(315)

# Interface.new.start







