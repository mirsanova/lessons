class RailwayStation
   attr_accessor  :trains, :name

  def initialize(name)
    @name = name
    @trains = [ ]
  end

  def take_train(train)
    @trains << train 
    puts "Поезд #{train} приходит на станцию #{name}"  
  end

  def show_train
    @trains.each do |train|
        puts "#{train.number}" 
     end        
  end

  def leave_train(train)
    @trains.delete(train)
    puts "Поезд #{train} покидает станцию #{name}"    
  end
end

class Route
  attr_accessor  :routes


  def initialize
      @routes = [ ]    
  end

  def start_station
    @routes.first  
  end

  def end_station
    @routes.last  
  end

  def add_station(station)
    @routes <<  station
    puts "Добавлена станция #{station.name}"  
  end

  def delete_station(station)
    @routes.delete(station)
    puts "Удалена станция #{station.name}"  
  end

  def print_routes
    @routes.each do |station|
      puts "Станция #{station.name}"
    end
end

  def routes
    @routes 
  end
end

class Train
  attr_accessor :speed, :count_wagons, :number
  attr_reader :type

  def initialize(type, number, count_wagons)
    @type = type
    @number = number
    @count_wagons = count_wagons
    @speed = 0
    @cur_index_station = 0
  end

  def go
    self.speed = 60
    puts "Поезд тронулся"
  end

  def stop
    self.speed = 0
    puts "Поезд остановился"
    
  end

  def cur_speed
    @speed    
  end

  def speed?
    @speed > 0 ? true : false
  end

  def show_count_wagons
    @count_wagons    
  end

  def add_wagon
    if speed == 0
      @count_wagons +=1
      puts "Текущее кол-во вагонов #{@count_wagons}"
    else
     puts "Невозможно добавить вагон, так как поезд движется"
    end  
  end

  def delete_wagon
    if speed == 0
      @count_wagons -=1
      puts "Текущее кол-во вагонов #{@count_wagons}"
    else
     puts "Невозможно убрать вагон, так как поезд движется"
    end  
  end

  def add_route(routes)
    @route = routes
    puts "Маршруты #{@route}"
  end

  def next_station
    if @route.size == 0
      puts "Не задан маршрут"
    else
      @cur_index_station +=1
      @next_station = @route[@cur_index_station]
      puts "Следущая стнция #{@next_station.name}"
    end
  end

  def show_station
    if @route.size == 0
      puts "Не задан маршрут"
    else
      puts "Текущая станция #{@route[@cur_index_station].name}"
    end
    
  end

end  

moskow = RailwayStation.new("Moskow")
piter = RailwayStation.new("Piter")
rnd = RailwayStation.new("Rostov")

route = Route.new
route.add_station(rnd)
route.add_station(moskow)
route.add_station(piter)
route.print_routes

train = Train.new(315, 'passenger', 25)
puts "jijon"
train.add_route(route.routes)
train.go
train.show_station
train.add_wagon
train.next_station
train.stop
train.add_wagon