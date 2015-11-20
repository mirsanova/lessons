class Interface
	def initialize
		@trains = Hash.new
		@stations = Hash.new		
	end

	def start
		loop do 
			puts "1 - создать станцию\n2 - создать поезд\n3 - добавить вагон к поезду\n4 - отцепить вагон от поезда\n5 - поместить поезд на станцию\n6 - просмотреть список станций\n7 - выход"
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
					del_wagon
				when 5
					move_train
				when 6	
					show_stations
  
			else
  				puts "Неправильный вариант... Попробуйте еще раз"
			end			
		end	
	end

	private

	def create_station
		begin
			print "Введите номер станции:"
			station_number = gets.chomp
			puts station_number
			print "Введите название станции:"
			station = gets.chomp
			puts station
			@stations[station_number] =  RailwayStation.new(station_number,station)
		rescue StandardError => e
			puts "#{e.message}"
		end		
	end

	def create_train
		print "Введите номер поезда:"
		train_number = gets.chomp
		puts "Укажите тип поезда: 1-пассажирский, 2-грузовой"
		train_var = gets.chomp.to_i

		begin
			if train_var == 1
				@trains[train_number] = PassangerTrain.new(train_number)

			elsif train_var == 2
				@trains[train_number] = CargoTrain.new(train_number)
			else
				puts "Неправильно введен номер"
			end
		rescue StandardError => e 
			puts "#{e.message}"
		end
		puts @trains
	end

	def add_wagon
		@trains.each do |number, train|
			puts "#{train.number} - #{train.train_type}"
		end 
		print "Введите номер поезда, к которому хотите добавить вагон:"
		train_number = gets.chomp
		train = @trains[train_number]

		if train
			puts "Какой тип вагона?  1 - Пассажирский 2 - Грузовой"
			wagon_var = gets.chomp.to_i
			begin
				if wagon_var == 1
					train.add_wagon(PassangerWagon.new(1))
					puts train.wagons

				elsif wagon_var == 2
					train.add_wagon(CargoWagon.new(1))
					puts train.wagons
				else
					puts "Неправильно введен тип вагона"
				end
			rescue StandardError => e 
				puts "#{e.message}"
			end
		end
	end

	def del_wagon
		@trains.each do |number, train|
			puts "#{train.number} - #{train.train_type}"
		end 
		print "Введите номер поезда, у которого хотите удалить вагон:"
		train_number = gets.chomp
		train = @trains[train_number]

		if train
			puts "Какой вагон хотите удалить?"
			train.wagons.each do |number,wagon|
				puts "Номер вагона #{number}"
			end

			wagon_number = gets.chomp.to_i
			wagon = train.wagons[wagon_number]
			train.remove_wagon(wagon) if wagon
		end
			
	end

	def move_train
		@trains.each do |number, train|
			puts "#{train.number} - #{train.train_type}"
		end 

		print "Введите номер поезда, который хотите переместить на станцию:"
		train_number = gets.chomp
		train = @trains[train_number]

		if train
			print "Введите номер станции, на которую хотите переместить поезд:"
			
			@stations.each do | key, value |
				puts "#{value.station_number} - #{value.name}"
			
			end	

			station_number = gets.chomp
			station = @stations[station_number]
			station.take_train(train) if station
		end
	end	

	def show_stations
		puts "Список станций:"
		@stations.each do | key, value|
			puts "Станция № #{value.station_number} - #{value.name}"
			puts "Поезд"
			value.show_train
		end	
	end	


end	