% Question 3, Practical 2

sum = 0;
disp("Randomize 5 integers between 1 to 10 and calculate its sum! ")
for i = 1:1:5
    % Calculate the result
    sum = sum + randi(10,1);
end
fprintf("%.f\n", sum);

