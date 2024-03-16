% Question 1, Practical 2

% Checking inputs if it is valid:
while (true)
try
    weight = input("Enter your weight in kg: ", 's');      
    weight = str2double(weight);

    height = input("Enter your height in m: ", 's');
    height = str2double(height); 

    if (isnan(weight) || isnan(height)) 
        error('Invalid input: Not a number. Please re-enter your inputs!');
    end

    if (weight <= 0 || height <= 0)
        error('Invalid input: Zero or Negative integers. Please re-enter your inputs!')
    end
catch ME    
    disp(ME.message);
    continue
end          

% Calculate BMI
BMI = weight/height^2;                         
 
% Display to the screen
fprintf("Your BMI is: %.2f\n", BMI); 
return;     %if inputs are correct, break out of loop and print out.

end