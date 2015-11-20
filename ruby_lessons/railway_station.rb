class RailwayStation
   attr_accessor  :station_number, :name, :trains
   @@all = []  

  def initialize(station_number,name)
    begin
      @station_number = station_number
      @name = name
      @trains = []
      validate!
      @@all << self
    rescue RuntimeError => e 
      puts "#{e.message}"
    end
  end

  def self.all
      @@all
  end

  def valid?
    validate!
  rescue
    false
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

  private

  def validate!
    raise "Номер не может быть пустым" if station_number.nil?
    raise "Номер не может быть меньше 3 символов" if station_number.length < 3
    raise "Имя не может быть меньше 3 символов" if name.length < 3
    true
  end

  def trains
    @trains
  end
end
