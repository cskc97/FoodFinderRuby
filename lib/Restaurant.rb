class Restaurant

	attr_accessor :name,:type,:price
	
	def initialize(name,type,price)
		@name=name
		@type=type
		@price=price
		
	end


	def displayPattern()
		return @name +" 		"+@type+" 		"+@price
	end

	def self.addToList(restaurantName, restaurantType, restaurantPrice)
	file = File.new('restaurantlist.txt','a')
	restaurant = Restaurant.new(restaurantName.chomp,restaurantType.chomp,restaurantPrice.chomp)
	puts restaurant.displayPattern
	file.puts "#{restaurant.displayPattern()}"
	file.close
	restaurant=nil
	end

	


end



