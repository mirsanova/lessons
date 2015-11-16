class Train
  attr_accessor :speed, :number
  
  def initialize(number)
    @number = number
    @wagons = Hash.new
    @speed = 0
    @cur_index_station = 0
  end

  def next_station
    @next_station
  end

  def speed
    @speed    
  end

  def speed=(speed)
    @speed = speed
  end

  def go
    self.speed = 60
    puts "Поезд тронулся"
    next_station
  end

  def stop
    self.speed = 0
    puts "Поезд остановился"
    
  end

  def train_moving?
    speed > 0
  end

  def route=(route)
    @route = route
  end  

  def next_station
    if @route.size == 0
      puts "Не задан маршрут"
    else
      increase_index_station
      next_station = @route[cur_index_station]
      puts "Следущая стнция #{@next_station.name}"
    end
  end

  def show_station
    if @route.length == 0
      puts "Не задан маршрут"
    else
      puts "Текущая станция #{@route[@cur_index_station].name}"
    end    
  end

  def wagons
    @wagons    
  end

  def add_wagon(wagon)
    if wagon.wagon_type == train_type 
      if !train_moving?
        @wagons[wagon.number] = wagon
        puts "Вагон добавлен"
      else
        puts "Невозможно добавить вагон, так как поезд движется"
      end         
    else
      puts "Невозможно добавить вагон"
    end  
  end



  def remove_wagon(wagon)
    if wagon.wagon_type == train_type 
     if !train_moving?
      @wagons.delete(wagon.number)
      puts "Вагон удален"
     else
      puts "Невозможно добавить вагон, так как поезд движется"
     end
    else
     puts "Невозможно удалить вагон"
    end  
  end

  private

  def route
    @route
  end
 
  def cur_index_station
    @cur_index_station
  end
 
  def increase_index_station
    @cur_index_station = @cur_index_station +1
  end
end  