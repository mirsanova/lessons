class Route
  attr_accessor  :stations


  def initialize
      @stations = [ ]    
  end

  def start_station
    @routes.first  
  end

  def end_station
    @routes.last  
  end

  def add_station(station)
    stations <<  station
    puts "Добавлена станция #{station.name}"  
  end

  def delete_station(station)
    stations.delete station
    puts "Удалена станция #{station.name}"  
  end

  def print_routes
    stations.each do |station|
      puts "Станция #{station.name}"
    end
  end

end