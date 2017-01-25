require '.\Restaurant.rb'

$RestaurantsArray=[]



def displayRestaurants()

	$RestaurantsArray.clear

	puts"RESTAURANT NAME 		CUISINE TYPE 		PRICE"
	puts"_________________________________________________________________________________________________________________"


	file = File.new("restaurantlist.txt","r")
	while(line = file.gets)
		lArray = line.split
		$RestaurantsArray.push(Restaurant.new(lArray[0],lArray[1],lArray[2]))
		
		
		puts line if(line!=nil)
	end
end


def findByName(restName)

	

	restName=restName.chomp
	foundVar=$RestaurantsArray.find{|restaurant| restaurant.name == restName}
	if(foundVar!=nil)
		puts foundVar.displayPattern
	else
		puts "Not found"
	end


end

def findByType(typeVal)
	puts "Inside find by type method"
	typeVal = typeVal.chomp
	puts typeVal
	puts "Empty" if $RestaurantsArray==[] || $RestaurantsArray==nil
	foundVar = $RestaurantsArray.find_all{|restaurant| return restaurant.type==typeVal}
	puts foundVar
	if(foundVar!=nil)
		for rest in foundVar
			puts rest.displayPattern
		end
	else
		puts "Not Found"
	end
end

def findByPrice(price)
	puts "Under Construction"
end



def findBy(choice)

	puts "inside findby method"
	choice = choice.chomp
	if(choice=="name")
		puts "Enter Restaurant Name to Find"
		rName = gets
		findByName(rName)
	elsif(choice=="type")
		puts "Enter Restaurant Type to Find"
		tName = gets.chomp
		findByType(tName)
	elsif(choice=="price")
		puts"Enter Price"
		priceValue = gets
		findByPrice(priceValue)

	end
end



def menu()
	puts "1. ADD A RESTAURANT 	2.LIST RESTAURANTS. 	3.FIND A RESTAURANT 	4.QUIT"
	menuChoice = gets
	puts "YOU SELECTED #{menuChoice}"
	menuChoice=menuChoice.to_i
	if(menuChoice==1)
		
		puts "Enter name, type and price of the restaurant"
		nameVal = gets
		typeVal = gets
		priceVal=gets
		Restaurant.addToList(nameVal,typeVal,priceVal)
	
	elsif (menuChoice==2)

		displayRestaurants

	elsif (menuChoice==3) 
		displayRestaurants
		puts "Find by name, type or price?"
		choice = gets.chomp
		findBy(choice)
		
		
	elsif (menuChoice==4) 
		exit!
	end
	


end



#####RUNNING PART##########

boolVal=true
while(boolVal)
	menu()
	puts "Continue?"
	stringVal=gets.chomp
	if(stringVal=="yes")
		boolVal=true
	else
		boolVal=false
	end

end







