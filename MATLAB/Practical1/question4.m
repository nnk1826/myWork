    
population          = input('Please enter the population: ');               %Population in the city
kmTravel            = input('Please enter the travel km(s) per day: ');     %km travel per day
fuelConsumption     = input('Please enter the cost for fuel: ');            %Fuel cost per 1 km travel
totalCost           = population * (kmTravel+ fuelConsumption);
fprintf('Total daily cost of transport in the city: %.1f AUD\n',totalCost);

