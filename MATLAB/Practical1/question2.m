disp('The daily water usasge of HCMC: ');    
population  = input('Please enter the population: ');

%info based on study posted on tuoitrenews.vn
waterUsagePerCapita = 6800;     %in liters

%Calculate total wate usage per day
totalWaterUsage     = waterUsagePerCapita * population / 1000;
fprintf('The total daily water usage of the city is %.1f kiloliters \n',totalWaterUsage);




% if ~isnan(population) && isfinite(population) && population == round(population)
%     disp('Valid integer entered:');
%     disp(population_double);
% else
%     disp('Invalid input. Please enter a valid integer.');
% end
