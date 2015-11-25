require_relative 'manufacturer'
class Train
  include Manufacturer
  attr_accessor :speed, :number, :wagons

  NUMBER_FORMAT = /^([a-z]|\d){3}-?([a-z]|\d){2}$/i
  @@trains = Hash.new


  def initialize(number)
    @number = number
    @wagons = Hash.new
    @speed = 0
    @cur_index_station = 0
    validate!
    @@trains[number] = self


  end

  def each_wagon(&block)
    wagons.each do |number, wagon|
      block.call(wagon)
    end
    
  end

  def self.find(number)
    puts "Find"
    @@trains[number]
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
    @routes = route
  end  

  def next_station
    if @routes.size == 0
      raise "Не задан маршрут"
    else
      increase_index_station
      @next_station = @routes[cur_index_station]
      puts "Следущая стнция #{@next_station.name}"
    end
  end

  def show_station
    if @routes.size == 0
      raise "Не задан маршрут"
    else
      puts "Текущая станция #{@routes[@cur_index_station].name}"
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
        raise "Невозможно добавить вагон, так как поезд движется"
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
      raise "Невозможно удалить вагон, так как поезд движется"
     end
    else
     puts "Невозможно удалить вагон"
    end  
  end

  def valid?
    validate!
  rescue
    false
  end

  private

  def validate!
    raise "Номер не может быть пустым" if number.nil?
    raise "Номер не может быть меньше 3 символов" if number.length < 3
    raise "Неверный формат номер поезда" if number !~ NUMBER_FORMAT
    raise "Неуникальный номер поезда!" if !Train.find(number).nil?
    true
  end

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