class Interface
	def initialize
		@trains = Hash.new
		@stations = Hash.new		
	end

	def start
		loop do 
			puts "1 - создать станцию\n2 - создать поезд\n3 - добавить вагон к поезду\n4 - отцепить вагон от поезда\n5 - поместить вагон на станцию\n6 - просмотреть список станций и список поездов на станции\n7 - выход"
			var = gets.chomp.to_i

			break if var == 7

			case var
			
				when 1
					create_station
				when 2
					create_train
				when 3
					add_wagon
				when 4
				when 5
				when 6	
  
			else
  				puts "Неправильный вариант... Попробуйте еще раз"
			end			
		end	
	end

	private

	def create_station
		print "Введите номер станции:"
		station_number = gets.chomp
		puts station_number
		print "Введите название станции:"
		station = gets.chomp
		puts station
		@stations[station_number] =  RailwayStation.new(station_number,station)		
	end

	def create_train
		print "Введите номер поезда:"
		train_number = gets.chomp
		puts "Укажите тип поезда: 1-пассажирский, 2-грузовой"
		train_var = gets.chomp.to_i

		if train_var == 1
			@trains[train_number] = PassangerTrain.new(train_number)

		elsif train_var == 2
			@trains[train_number] = CargoTrain.new(train_number)
		else
			puts "Неправильно введен номер"
		end
	end

	def add_wagon
		@trains.each do |number, train|
			puts "#{train.number} - #{train.train_type}"
		end 
		print "Введите номер поезда, к которому хотите добавить вагон:"
		train_number = gets.chomp.to_i
		train = @trains[train_number]

		if train
			puts "Какой тип вагона?  1 - Пассажирский 2 - Грузовой"
			wagon_var = gets.chomp.to_i
			if wagon_var == 1
				train.add_wagon(CargoWagon.new(1))

			elsif wagon_var == 2
				train.add_wagon(PassangerWagon.new(1))
			else
				puts "Неправильно введен тип вагона"
			end
		end
	end	




end	