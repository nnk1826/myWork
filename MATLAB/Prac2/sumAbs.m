% Question 2, Practical 2

absSum = 0;
disp("Please enter 5 numbers of your choice: ")
for i = 1:1:5
    fprintf('The %i number: ', i);
    % Enter 5 numbers
    numberInput = input("");
    % Calculate the result
    absSum = absSum + abs(numberInput);
end
fprintf("The absolute sum is: %.1f\n", absSum);


