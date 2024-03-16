% Question 4, Practical 2

while (true)
    disp("Please enter the heights of 5 students! ")
try
   for i = 1:1:5
        ordinal = myOrdinalNotation(i);          %using my own function to print out ordinal notation   

        % Enter the heights of the sudents (in cm)
        fprintf('Height of the %s student: ', ordinal);
        height = input("",'s');
        studentHeight(i) = str2double(height);

        % Check input validation
        if (isnan(studentHeight(i)))
            error('Invalid input: Not a number. Please re-enter your inputs!');
        end
   end
catch ME    
    disp(ME.message);
    continue
end         

% Display the heights of 5 students
for i = 1:1:5
    disp(studentHeight(i));
    disp("");
end
return;
end

