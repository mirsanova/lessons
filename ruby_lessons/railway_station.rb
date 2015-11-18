class RailwayStation
   attr_accessor  :station_number, :name, :trains
   @@all = []  

  def initialize(station_number,name)
    @station_number = station_number
    @name = name
    @trains = []
    @@all << self
  end

  def self.all
      @@all
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

  def trains
    @trains
  end
end
