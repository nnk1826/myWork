% Question 2, Practical 2

absSum = 0;

while (true)
    disp("Please enter 5 numbers of your choice: ")
try
   for i = 1:1:5
        ordinal = myOrdinalNotation(i);          % Using my own function to print out ordinal notation     
        fprintf('The %s number: ', ordinal);

        % Enter 5 numbers
        numberInput = input("",'s');
        numberInput = str2double(numberInput);

        % Check input validation
        if (isnan(numberInput))
            error('Invalid input: Not a number. Please re-enter your inputs!');
        end

        % Calculate the result
        absSum = absSum + abs(numberInput);
   end
catch ME    
    disp(ME.message);
    continue
end         
fprintf("The absolute sum is: %.1f\n", absSum);
return;
end

