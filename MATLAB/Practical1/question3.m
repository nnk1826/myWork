disp('The daily water usasge of HCMC: ');    
population = input('Please enter the population: ');

waterUsagePerCapita = 6800;     %in liters
plantCapacity       = 300000;   %kiloliters
totalWaterUsage     = waterUsagePerCapita * population / 1000;
coveragePercentage  = plantCapacity / totalWaterUsage * 100;
fprintf('Desalination plant can cover %.2f%% of daily water use. \n',coveragePercentage);